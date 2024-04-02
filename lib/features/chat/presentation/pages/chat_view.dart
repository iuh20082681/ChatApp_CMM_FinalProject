import 'package:flutter/material.dart';

import '../widgets/group_chat_session.dart';
import '../widgets/single_chat_sesstion.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(
      () {
        if (scrollController.offset < 0) {
          scrollController.jumpTo(0);
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          SingleChatSession(
            isSingleChat: true,
            chatUserName: "Trọng Trí",
            lastTimeActive: "20/6",
            lastMessage: "Hello",
            imgUrl:
                "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
            isPin: false,
          ),
          GroupChatSession(
            isPin: false,
          ),
        ],
      ),
    );
  }
}
