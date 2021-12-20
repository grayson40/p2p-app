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
          alignment: Alignment.topRight,
          icon: const Icon(
            Icons.settings,
            color: Colors.green,
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
              backgroundColor: Colors.grey,
              radius: 70,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('wins tapped');
                      },
                      child: const Text(
                        "Wins: ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text(
                      "0",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('losses tapped');
                      },
                      child: const Text(
                        "Losses: ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text(
                      "0",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              height: 70,
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
        backgroundColor: Colors.green,
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
