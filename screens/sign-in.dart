// ignore: file_names
import 'package:flutter/material.dart';
import 'package:login_signup_flow_app/screens/homescreen.dart';
import 'package:login_signup_flow_app/screens/sign-up.dart';
import 'package:login_signup_flow_app/utils/colors.dart';
import 'package:login_signup_flow_app/reuseable_widget/reusable_widget.dart';
class SignInscreen extends StatefulWidget {
  const SignInscreen({Key? key}) : super(key: key);

  @override
  State<SignInscreen> createState() => _SignInscreenState();
}

class _SignInscreenState extends State<SignInscreen> {
final TextEditingController _passwordTextController = TextEditingController();
 final TextEditingController _emailTextController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                const Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(
                height: 30,
              ),
             reusableTextField("Enter UserName",Icons.person_outline,false,
             _emailTextController),
             const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Password",Icons.lock_outline,true,
             _passwordTextController),
              const SizedBox(
                height: 30,
              ),
              signInSignUpButton(context, true, () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const HomeScreen()));
              }),
              signUpOption()
              ],
               ),
            ),
          ),
        ),
      );
  }

  Row signUpOption() {
    return Row (
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
          style:  TextStyle(color: Colors.white70)),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
            },
          
        child: const Text
        (" Sign Up",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
       )
      ],
    );
  }
}
