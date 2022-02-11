import 'package:flutter/material.dart';
import 'package:p2p_app/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // TO-DO
  // Add a floating icon button which will toggle between light/dark mode
  // Add change/reset password setting
  // Add change email setting

  // Set the theme based off button toggle
  void _setTheme() {
    setState(() {
      MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
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
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 55),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(
            MyApp.themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode,
            color: Colors.white,
          ),
          onPressed: () {
            _setTheme();
          },
        ),
      ),
    );
  }
}
