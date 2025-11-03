import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app_sqlite_riverpod/notes/model/models/note_model.dart';
import 'package:note_app_sqlite_riverpod/notes/view/screens/edit_note_screen.dart';
import 'package:note_app_sqlite_riverpod/notes/view_model/notes_riverpod_controller.dart';
class NoteDetailsScreen extends ConsumerWidget {
  const NoteDetailsScreen({super.key,required this.noteModel});
final NoteModel noteModel;
  @override
  Widget build(BuildContext context ,ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noteModel.title,style: TextStyle(fontSize: 19,fontFamily: 'Montserrat',fontWeight: FontWeight.w700,color: Colors.black,)),
        actions: [IconButton(onPressed: (){
         final TextEditingController title =TextEditingController();
          title.text=noteModel.title;
          TextEditingController note =TextEditingController();
          note.text =noteModel.description;
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditNoteScreen(noteModel: noteModel,)));
        }, icon: Icon(Icons.edit)),
        IconButton(onPressed: () async {
        final controller = ref.read(notesControllerProvider.notifier);
        await controller.deleteNote(noteModel.id!);


        Navigator.pop(context);


        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        content: Text('Note deleted successfully!'),
        backgroundColor: Colors.redAccent,
        ),
        );
        }, icon: Icon(Icons.delete))
        ],
        leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(CupertinoIcons.back)),
      ),
      backgroundColor: Color(0xffF8F8F8),
    body: SingleChildScrollView(
child: Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(noteModel.description,style: TextStyle(fontSize: 10.5,fontFamily: 'Montserrat',fontWeight: FontWeight.w400,color: Colors.black,),textAlign: TextAlign.justify,),
    )
  ],


),
    ),
    );
  }
}
