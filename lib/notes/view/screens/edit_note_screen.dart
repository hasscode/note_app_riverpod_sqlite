import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app_sqlite_riverpod/core/widgets/custom_text_form_field.dart';
import 'package:note_app_sqlite_riverpod/notes/model/models/note_model.dart';
import 'package:note_app_sqlite_riverpod/notes/view/widgets/list_of_colors_widget.dart';
import 'package:note_app_sqlite_riverpod/notes/view_model/notes_riverpod_controller.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key,required this.noteModel});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();

  final NoteModel noteModel ;
}

class _EditNoteScreenState extends State<EditNoteScreen> {

  GlobalKey<FormState> formKey= GlobalKey();
  TextEditingController titleController =TextEditingController();

  TextEditingController noteController =TextEditingController();
  Color selectedColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    titleController.text =widget.noteModel.title;
    noteController.text =widget.noteModel.description;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Add Note',
          style: TextStyle(
            fontSize: 19,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      backgroundColor: Color(0xffF8F8F8),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomTextFormField(
                  textEditingController: titleController,
                  hintText: 'write title here',
                  maxLines: 1,
                  title: 'Title',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomTextFormField(
                  textEditingController: noteController,
                  hintText: 'write note here',
                  maxLines: 10,
                  title: 'Note',
                ),
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {


                  return ElevatedButton(
                    onPressed: () async{

                      final controller = ref.read(notesControllerProvider.notifier);
                      await controller.updateNote(NoteModel(id: widget.noteModel.id, title: titleController.text, description: noteController.text, dateTime: DateTime.now().toString(), color: selectedColor));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13.0,horizontal: 100),
                      child: const Text(
                        'Edit Note',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },

              ),

              ListOfColorsWidget(onColorSelected:(color){
                setState(() {
                  selectedColor = color ;
                });
              } ,),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.clear();
    noteController.clear();
  }
}
