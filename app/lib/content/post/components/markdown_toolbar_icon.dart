import 'package:flutter/material.dart';

class MarkDownToolbarIcon extends StatelessWidget {
  const MarkDownToolbarIcon({Key? key, required this.controller, required this.icon, required this.left, required this.right}) : super(key: key);

  final TextEditingController controller;
  final IconData icon;
  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        String currenText = controller.text;
        TextSelection selection = controller.selection;
        if (selection.isValid) {
          String selectedText = selection.textInside(currenText);
          selectedText = '$left$selectedText$right';
          String newText = selection.textBefore(currenText) + selectedText + selection.textAfter(currenText);
          controller.text = newText;
        }
      },
      icon: Icon(icon),
      iconSize: 12,
    );
  }
}
