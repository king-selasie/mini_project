import 'package:flutter/material.dart';
import 'package:login_signup_flow_app/Rooms/Beds.dart';
import 'package:login_signup_flow_app/reuseable_widget/reusable_widget.dart';
import 'package:login_signup_flow_app/utils/colors.dart';

class Register extends StatefulWidget {
  final String bedName;

  const Register({required this.bedName, Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.bedName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("C82893"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Name", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email", Icons.email, false,
                    _emailTextController), 
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Phone number", Icons.lock_outline, true,
                    _phoneNumberController),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Beds(
                          roomName: widget.bedName,
                          onDelete: (bedName) {
                            
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text('Add Member'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
