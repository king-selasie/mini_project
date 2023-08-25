import 'package:flutter/material.dart';
import 'package:login_signup_flow_app/reuseable_widget/reusable_widget.dart';
import 'package:login_signup_flow_app/utils/colors.dart';
import 'package:login_signup_flow_app/screens/homescreen.dart';
import 'package:login_signup_flow_app/screens/homescreenstudent.dart';

enum UserType { HostelOwner, Student }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  UserType _selectedUserType = UserType.Student; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold),
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
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.email, false,
                    _emailTextController), 
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                 DropdownButtonFormField<UserType>(
                  value: _selectedUserType,
                  onChanged: (UserType? newValue) {
                    setState(() {
                      _selectedUserType = newValue ?? UserType.Student;
                    });
                  },
                  items: UserType.values.map((UserType type) {
                    return DropdownMenuItem<UserType>(
                      value: type,
                      child: Text(type == UserType.HostelOwner ? 'Hostel Owner' : 'Student'),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  if (_selectedUserType == UserType.Student) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreenstudent(),
                      ),
                    );
                  } else if (_selectedUserType == UserType.HostelOwner) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}