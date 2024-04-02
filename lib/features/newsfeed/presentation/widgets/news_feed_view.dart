import 'package:flutter/material.dart';

class NewsFeedView extends StatefulWidget {
  const NewsFeedView({super.key});

  @override
  _NewsFeedViewState createState() => _NewsFeedViewState();
}

class _NewsFeedViewState extends State<NewsFeedView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.red,
            height: 400,
            width: double.infinity,
          ),
          Container(
            color: Colors.amber,
            height: 400,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
