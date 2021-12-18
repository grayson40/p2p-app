class NoteModel {
  String? noteId;
  String? note;

  NoteModel({this.noteId, this.note});

  factory NoteModel.fromMap(map) {
    return NoteModel(noteId: map['nid'], note: map['notes']);
  }

  Map<String, dynamic> toMap() {
    return {'nid': noteId, 'note': note};
  }
}
