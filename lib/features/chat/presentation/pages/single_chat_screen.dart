import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/chat_widget.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({super.key});

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  final ScrollController _chatViewController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatViewController.addListener(() {
      if (_chatViewController.offset <= 0) {
        _chatViewController.jumpTo(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Single chat!",
          style: sfBold(
            tColor: Colors.white,
            tSize: 20,
          ),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primaryThemeColor,
        actions: [
          SizedBox(
            width: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: const Icon(
                    Icons.photo_camera_front,
                    size: 35,
                  ),
                  onTap: () => {},
                ),
                InkWell(
                  child: const Icon(
                    Icons.more_vert,
                    size: 35,
                  ),
                  onTap: () => {},
                )
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.fadeGray.withOpacity(0.15),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: ListView(
                    controller: _chatViewController,
                    reverse: true,
                    children: [
                      ChatWidget(
                        content:
                            "this is very long long long long long text chac tao khong muon noi nhieu dau thang mat lon ak dmdm",
                        isMine: true,
                      ),
                      ChatWidget(
                        content:
                            "this is also very very long long text he he dm dm",
                        isMine: true,
                      ),
                      ChatWidget(
                        content:
                            "this is also very very long long text he he dm dm",
                        isMine: false,
                      ),
                      ChatWidget(
                        content: "Hello world4",
                        isMine: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ChatInputBar(),
          ],
        ),
      ),
    );
  }
}
