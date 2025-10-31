import 'package:flutter/material.dart';
class ColorItemWidget extends StatelessWidget {
  const ColorItemWidget({super.key,required this.color,required this.isSelected});
final Color color;
final bool isSelected ;
  @override
  Widget build(BuildContext context) {
    return !isSelected? CircleAvatar(
      radius: 20,
      backgroundColor: color,
    ): CircleAvatar(
      radius: 35,
      backgroundColor: color,
      child: Icon(Icons.check,color:Colors.white ,size: 40,),
    ) ;
  }
}
