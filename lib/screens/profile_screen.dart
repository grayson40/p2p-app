import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p2p_app/screens/login_screen.dart';
import 'package:p2p_app/models/user_model.dart';
import 'package:p2p_app/screens/nav_screen.dart';
import 'package:p2p_app/screens/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (context) => const Nav()));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Nav()));
          },
        ),
        flexibleSpace: IconButton(
          padding: EdgeInsets.fromLTRB(40, 40, 20, 40),
          alignment: Alignment.centerRight,
          icon: const Icon(
            Icons.settings,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: 70,
            ),
            const Divider(
              height: 100,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 10),
                      Text(
                        loggedInUser.username.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email),
                      const SizedBox(width: 10),
                      Text(
                        loggedInUser.email.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logout(context);
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  } // logout()
}
