import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p2p_app/models/user_model.dart';
import 'package:p2p_app/screens/login_screen.dart';
import 'package:p2p_app/screens/home_screen.dart';
import 'package:p2p_app/screens/notes_screen.dart';
import 'package:p2p_app/screens/profile_screen.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  // Selected index of bottom nav bar
  int _selectedIndex = 0;

  // Create an instance of firebase current user. Instantiate user model.
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  // Create a list of widgets for nav bar screens
  final List<Widget> screenList = <Widget>[
    const HomeScreen(),
    const NotesScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  // Grab selected index of navbar when pressed
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screenList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.notes_rounded), title: Text("Notes")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Account"))
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
