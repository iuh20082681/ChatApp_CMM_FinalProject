import 'package:flutter/material.dart';

import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';
import '../../../newsfeed/presentation/widgets/news_feed_view.dart';
import '../../../settings/presentation/widgets/settings_view.dart';
import 'chat_view.dart';

class ChatManagerScreen extends StatefulWidget {
  const ChatManagerScreen({super.key});

  @override
  _ChatManagerScreenState createState() => _ChatManagerScreenState();
}

class _ChatManagerScreenState extends State<ChatManagerScreen> {
  static const List<Widget> _viewList = <Widget>[
    ChatView(),
    NewsFeedView(),
    SettingsView(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryThemeColor,
        leading: GestureDetector(
          child: const Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          onTap: () => {},
        ),
        title: GestureDetector(
          child: SizedBox(
            width: double.maxFinite,
            child: Text(
              "Tìm kiếm",
              style: sfSemibold(
                tColor: Colors.white70,
                tSize: 17,
              ),
            ),
          ),
          onTap: () => {},
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
              onTap: () => {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _viewList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: "Tin nhắn",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Nhật ký",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Cá nhân",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (index) => {
          setState(() {
            _selectedIndex = index;
          })
        },
      ),
    );
  }
}
