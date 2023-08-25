import 'package:flutter/material.dart';
import 'package:login_signup_flow_app/Rooms/Beds.dart';

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  List<String> rooms = ['Room 1', 'Room 2']; 

  void addRoom() {
    setState(() {
      int newRoomNumber = rooms.length + 1;
      rooms.add('Room $newRoomNumber');
    });
  }
  
  void removeRoom(String room) {
    setState(() {
      rooms.remove(room);
    });
  }

  Future<void> _navigateToBeds(String room) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Beds(
          roomName: room,
          onDelete: removeRoom, 
        ),
      ),
    );

    if (result != null) {
      removeRoom(result); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo6.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (String room in rooms)
                  ElevatedButton(
                    onPressed: () async {
                      await _navigateToBeds(room); 
                    },
                    child: Text(room),
                  ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addRoom, 
                  child: const Text('Add Room'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), 
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
