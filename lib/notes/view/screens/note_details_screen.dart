import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app_sqlite_riverpod/notes/model/models/note_model.dart';
class NoteDetailsScreen extends StatelessWidget {
  const NoteDetailsScreen({super.key,required this.noteModel});
final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note one',style: TextStyle(fontSize: 19,fontFamily: 'Montserrat',fontWeight: FontWeight.w700,color: Colors.black,)),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
        IconButton(onPressed: (){}, icon: Icon(Icons.delete))
        ],
        leading: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.back)),
      ),
      backgroundColor: Color(0xffF8F8F8),
    body: SingleChildScrollView(
child: Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text('asfoiguhgiojsjjgggfrjjhujasfdjffsajfjfashfuifuiufadshfiuhgeriughrkjgnfrjkgfkjgbgjrbgrkjgbhrl,kghf/s.,dgkha asfoiguhgiojsjjgggfrjjhujasfdjffsajfjfashfuifuiufadshfiuhgeriughrkjgnfrjkgfkjgbgjrbgrkjgbhrl,kghf/s.,dgkha v asfoiguhgiojsjjgggfrjjhujasfdjffsajfjfashfuifuiufadshfiuhgeriughrkjgnfrjkgfkjgbgjrbgrkjgbhrl,kghf/s.,dgkha',style: TextStyle(fontSize: 10.5,fontFamily: 'Montserrat',fontWeight: FontWeight.w400,color: Colors.black,),textAlign: TextAlign.justify,),
    )
  ],


),
    ),
    );
  }
}
