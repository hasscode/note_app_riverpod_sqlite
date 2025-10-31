import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.only( topRight: Radius.circular(35),topLeft: Radius.circular(35)),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,

        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Filter Button
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.black87, size: 28),
                onPressed: () {

                },
              ),

              // Right Search Button
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black87, size: 28),
                onPressed: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}