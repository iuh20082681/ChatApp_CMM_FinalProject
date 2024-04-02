import 'package:flutter/material.dart';

import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';

class ChatWidget extends StatefulWidget {
  final String content;
  final bool isMine;
  const ChatWidget({super.key, required this.content, required this.isMine});

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: widget.isMine
          ? Align(
              alignment: Alignment.centerRight,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth * 0.7,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryThemeColor.withOpacity(0.8)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.content,
                    style: sfSemibold(
                      tColor: Colors.white,
                      tSize: 16,
                    ),
                  ),
                ),
              ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.fadeGray.withOpacity(0.3),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth * 0.7,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      widget.content,
                      style: sfSemibold(
                        tColor: AppColors.mainTextColor,
                        tSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
