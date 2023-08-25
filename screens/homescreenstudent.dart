import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_flow_app/screens/complaintsPage.dart';
import 'package:login_signup_flow_app/screens/sign-in.dart';

class HomeScreenstudent extends StatefulWidget {
  const HomeScreenstudent({Key? key}) : super(key: key);

  @override
  State<HomeScreenstudent> createState() => _HomeScreenstudentState();
}

class _HomeScreenstudentState extends State<HomeScreenstudent> {
  void _handleLogout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInscreen()),
    );
  }

  void _navigateToComplaintsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComplaintsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          ElevatedButton.icon(
            onPressed: () => _handleLogout(context),
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Hi Kingsley',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Good Day',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white54),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/logo3.png'),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          if (i == 0) {
                            _navigateToComplaintsPage();
                          }
                          
                        },
                        child: itemDashboard(
                          ['Complaints', 'Announcements', 'About', 'Notice'][i],
                          [
                            CupertinoIcons.play_rectangle,
                            CupertinoIcons.person_2,
                            CupertinoIcons.graph_circle,
                            CupertinoIcons.question_circle
                          ][i],
                          [
                            Colors.blueGrey,
                            Colors.brown,
                            Colors.green,
                            Colors.blue
                          ][i],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background) =>
      GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        ),
      );
}
