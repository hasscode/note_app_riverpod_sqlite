import 'package:flutter/material.dart';
import 'package:note_app_sqlite_riverpod/notes/model/models/note_model.dart';
class NoteItemWidget extends StatelessWidget {
  const NoteItemWidget({super.key,required this.noteModel});
final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xffBFBFBF)
          ),
          borderRadius: BorderRadius.circular(15),
          color: noteModel.color
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(noteModel.title,style: TextStyle( fontWeight: FontWeight.w700,fontFamily: 'Montserrat',fontSize: 17,color: Colors.black),),
            Spacer(flex: 1,),
            Text(noteModel.description,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle( fontWeight: FontWeight.w500,fontFamily: 'Montserrat',fontSize: 13.5,color: Colors.black),),
            Spacer(flex: 2,),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(noteModel.dateTime,style: TextStyle( fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 13.5,color: Colors.black),),
                )),
          ],
        ),
      ),
    );
  }
}
