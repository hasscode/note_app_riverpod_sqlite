import 'dart:ui';

class NoteModel{
  final int? id;
  final String title;
  final String description;
  final String dateTime;
  final Color color;

  NoteModel({required this.id, required this.title,  required this.description, required this.dateTime, required this.color});
factory NoteModel.fromSQL(Map<String,dynamic> sql){
  return NoteModel(id: sql['id'] as int, title: sql['title'], description: sql['note'], dateTime: sql['date'], color: Color(sql['color']));
}
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'note': description,
      'date': dateTime,
      'color': color.value, // convert Color → int
    };
  }


}