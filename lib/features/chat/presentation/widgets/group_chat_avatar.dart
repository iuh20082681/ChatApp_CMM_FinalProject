import 'package:flutter/material.dart';

import '../../../../configs/styles/app_colors.dart';
import '../../../../shared/enums/enums.dart';

class GroupChatAvatar extends StatefulWidget {
  final GroupChatType groupChatType;

  const GroupChatAvatar({super.key, required this.groupChatType});

  @override
  _GroupChatAvatarState createState() => _GroupChatAvatarState();
}

class _GroupChatAvatarState extends State<GroupChatAvatar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 55,
        width: 55,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 16.5,
                backgroundColor: AppColors.fadeGray.withOpacity(0.3),
                child: CircleAvatar(
                  radius: 15.5,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg"),
                    radius: 14.5,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: CircleAvatar(
                radius: 16.5,
                backgroundColor: AppColors.fadeGray.withOpacity(0.3),
                child: CircleAvatar(
                  radius: 15.5,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg"),
                    radius: 14.5,
                  ),
                ),
              ),
            ),
            widget.groupChatType == GroupChatType.baseGroupChat
                ? Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 16.5,
                      backgroundColor: AppColors.fadeGray.withOpacity(0.3),
                      child: CircleAvatar(
                        radius: 15.5,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg"),
                          radius: 14.5,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            Align(
              alignment: widget.groupChatType == GroupChatType.baseGroupChat
                  ? Alignment.topLeft
                  : Alignment.topCenter,
              child: CircleAvatar(
                radius: 16.5,
                backgroundColor: AppColors.fadeGray.withOpacity(0.3),
                child: CircleAvatar(
                  radius: 15.5,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg"),
                    radius: 14.5,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
