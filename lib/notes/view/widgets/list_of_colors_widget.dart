import 'package:flutter/material.dart';
import 'package:note_app_sqlite_riverpod/notes/view/widgets/color_item_widget.dart';
class ListOfColorsWidget extends StatefulWidget {
   const ListOfColorsWidget({super.key,required this.onColorSelected});
   final Function (Color)onColorSelected;
  @override
  State<ListOfColorsWidget> createState() => _ListOfColorsWidgetState();
}

class _ListOfColorsWidgetState extends State<ListOfColorsWidget> {
 List<Color>colors= const[
  Colors.red,
  Colors.blue,
  Colors.blueGrey,
  Colors.cyan,
  Colors.green,
  Colors.yellow,
  Colors.brown,
  Colors.purple,
];

  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,

        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder:(c,i)=> GestureDetector(
                onTap: (){
setState(() {
  selectedIndex =i;
  widget.onColorSelected(colors[i]);
});
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ColorItemWidget(color: colors[i], isSelected: selectedIndex ==i),
                ))));
  }
}
