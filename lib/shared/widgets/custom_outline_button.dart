import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color bgColor;
  final Color borderColor;
  final event;

  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.bgColor,
    required this.borderColor,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: event,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size.fromHeight(65),
        side: BorderSide(
          color: borderColor,
        ),
        backgroundColor: bgColor,
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
