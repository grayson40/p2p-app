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
    const titleStyle = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    const numberStyle = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20,
      fontWeight: FontWeight.w900,
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Nav()));
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 45,
            ),
            Text(
              loggedInUser.username == null
                  ? ""
                  : loggedInUser.username.toString(),
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsScreen()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          'https://lehighsports.com/images/2019/8/28/35_Grayson_Crozier_DSC_0039.jpg?width=300'),
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      loggedInUser.username == null
                          ? ""
                          : loggedInUser.username.toString(),
                      style: titleStyle,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Fort Lauderdale, FL',
                      style: titleStyle,
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('followers tapped');
                      },
                      child: const Text(
                        '0',
                        style: numberStyle,
                      ),
                    ),
                    const Text(
                      'Followers',
                      style: titleStyle,
                    ),
                    const Divider(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('wins tapped');
                      },
                      child: const Text(
                        '0',
                        style: numberStyle,
                      ),
                    ),
                    const Text(
                      'Wins',
                      style: titleStyle,
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('following tapped');
                      },
                      child: const Text(
                        '0',
                        style: numberStyle,
                      ),
                    ),
                    const Text(
                      'Following',
                      style: titleStyle,
                    ),
                    const Divider(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('losses tapped');
                      },
                      child: const Text(
                        '0',
                        style: numberStyle,
                      ),
                    ),
                    const Text(
                      'Losses',
                      style: titleStyle,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              height: 50,
              thickness: 2,
            ),
            const Text(
              'data',
              style: titleStyle,
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
