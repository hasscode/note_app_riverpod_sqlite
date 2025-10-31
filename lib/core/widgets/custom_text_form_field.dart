import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,required this.hintText,required this.maxLines,required this.title});
final String hintText;
final String title;
final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Text(title,style: TextStyle(fontSize: 15.5,fontFamily: 'Montserrat',fontWeight: FontWeight.w700,color: Colors.black,)),
SizedBox(height: 10,),
        TextFormField(
          maxLines: maxLines,
          validator: (v){
            if(v==null||v.isEmpty){
              return 'This field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xff22699F))
            ),
               enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffA2C0D7))
        ),

          ),
        ),
      ],
    );
  }
}
