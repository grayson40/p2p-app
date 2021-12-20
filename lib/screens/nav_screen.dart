import 'package:flutter/material.dart';
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

  // Create a list of widgets for nav bar screens
  final List<Widget> screenList = <Widget>[
    const HomeScreen(),
    const NotesScreen(),
    const ProfileScreen(),
  ];

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
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notes_rounded),
              title: Text(
                "Notes",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text(
                "Account",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ))
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Colors.green,
      ),
    );
  }
}
