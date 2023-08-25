import 'package:flutter/material.dart';
import 'package:login_signup_flow_app/Rooms/Register.dart';

class Beds extends StatefulWidget {
  final String roomName;
  final Function(String) onDelete;

  const Beds({required this.roomName, required this.onDelete, Key? key})
      : super(key: key);

  @override
  State<Beds> createState() => _BedsState();
}

class _BedsState extends State<Beds> {
  List<String> beds = ['Bed 1', 'Bed 2'];

  void addBed() {
    setState(() {
      int newBedNumber = beds.length + 1;
      beds.add('bed $newBedNumber');
    });
  }

  void deleteRoom() {
    widget.onDelete(widget.roomName);
    Navigator.pop(context, widget.roomName);
  }

  void _navigateToRegister(String bedName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Register(bedName: bedName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.roomName),
        actions: [
          IconButton(
            onPressed: deleteRoom,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo8.jpg'),
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
                for (String bed in beds)
                  ElevatedButton(
                    onPressed: () {
                      _navigateToRegister(bed);
                    },
                    child: Text(bed),
                  ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addBed,
                  child: const Text('Add Bed'),
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
