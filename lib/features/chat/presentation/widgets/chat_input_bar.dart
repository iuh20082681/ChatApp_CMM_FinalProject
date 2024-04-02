import 'package:flutter/material.dart';

import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({super.key});

  @override
  _ChatInputBarState createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final TextEditingController _chatController = TextEditingController();
  bool isInputing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.borderGray),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 8,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  autocorrect: false,
                  controller: _chatController,
                  keyboardType: TextInputType.multiline,
                  style: sfMedium(
                    tColor: AppColors.mainTextColor,
                    tSize: 18,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Nhập tin nhắn...",
                    hintStyle: sfMedium(
                      tColor: AppColors.fadeGray.withOpacity(0.9),
                      tSize: 18,
                    ),
                  ),
                  onTapOutside: (event) => {
                    FocusManager.instance.primaryFocus?.unfocus(),
                  },
                  onChanged: (value) => {},
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Icon(
              Icons.send,
              color: AppColors.primaryThemeColor,
            ),
          ),
        ],
      ),
    );
  }
}
