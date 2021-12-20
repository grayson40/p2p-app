import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:p2p_app/models/note_model.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  // Form key
  // final _formKey = GlobalKey<FormState>();

  // Firebase auth
  // final _auth = FirebaseAuth.instance;

  // Editing controllers
  final noteEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Note text field
    final noteTextField = TextFormField(
      autofocus: false,
      controller: noteEditingController,
      onSaved: (value) {
        noteEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: "Type note here...",
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.book),
        title: const Text("Notes"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 90, 20),
        alignment: Alignment.bottomLeft,
        child: noteTextField,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("${noteEditingController.text}");
          noteEditingController.clear();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  // postDetailsToFirestore() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;

  //   NoteModel noteModel = NoteModel();

  //   // Writing the note
  //   noteModel.note = noteEditingController.text;
  //   noteModel.uid = user!.uid;

  //   await firebaseFirestore
  //       .collection("notes")
  //       .doc(user.uid)
  //       .set(noteModel.toMap());

  //   Fluttertoast.showToast(msg: "Note saved successfully!");
  // }

}
