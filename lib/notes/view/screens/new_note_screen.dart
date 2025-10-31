import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app_sqlite_riverpod/core/widgets/custom_text_form_field.dart';
import 'package:note_app_sqlite_riverpod/notes/view/widgets/list_of_colors_widget.dart';
class NewNoteScreen extends StatelessWidget {
  const NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Add Note',style: TextStyle(fontSize: 19,fontFamily: 'Montserrat',fontWeight: FontWeight.w700,color: Colors.black,)),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(CupertinoIcons.back)),
      ),
      backgroundColor: Color(0xffF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Padding(
             padding: const EdgeInsets.all(12.0),
             child: CustomTextFormField(hintText: 'write title here', maxLines: 1, title: 'Title'),
           ),
           Padding(
             padding: const EdgeInsets.all(12.0),
             child: CustomTextFormField(hintText: 'write note here', maxLines: 10, title: 'Note'),
           ),
        
        ListOfColorsWidget()
        
          ],
        ),
      ),
    );
  }
}
