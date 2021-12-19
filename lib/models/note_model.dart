class NoteModel {
  String? note;
  String? uid;

  NoteModel({this.note, this.uid});

  factory NoteModel.fromMap(map) {
    return NoteModel(note: map['note'], uid: map['uid']);
  }

  Map<String, dynamic> toMap() {
    return {'note': note, 'uid': uid};
  }
}
