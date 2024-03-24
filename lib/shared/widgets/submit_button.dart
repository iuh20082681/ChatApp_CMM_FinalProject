import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color bgColor;
  // ignore: prefer_typing_uninitialized_variables
  final event;

  const SubmitButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.bgColor,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: event,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: const Size.fromHeight(65),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
