import 'package:flutter/material.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';
import '../../../../shared/enums/enums.dart';
import 'group_chat_avatar.dart';

class GroupChatSession extends StatefulWidget {
  final bool isPin;
  const GroupChatSession({super.key, required this.isPin});

  @override
  _GroupChatSessionState createState() => _GroupChatSessionState();
}

class _GroupChatSessionState extends State<GroupChatSession> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
        color: widget.isPin ? AppColors.lightGray : Colors.white,
        height: 85,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 15, 25, 15),
                child: GroupChatAvatar(
                  groupChatType: GroupChatType.advancedGroupChat,
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.fadeGray.withOpacity(0.3),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Chat name",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: sfSemibold(
                                tColor: Colors.black,
                                tSize: 17,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  widget.isPin
                                      ? Icon(
                                          Icons.push_pin,
                                          size: 15,
                                          color: AppColors.mainTextColor
                                              .withOpacity(0.4),
                                        )
                                      : const SizedBox(),
                                  Icon(
                                    Icons.notifications_off,
                                    size: 15,
                                    color: AppColors.mainTextColor
                                        .withOpacity(0.4),
                                  ),
                                  Text(
                                    "T5",
                                    style: sfLight(
                                        tColor: AppColors.mainTextColor
                                            .withOpacity(0.7),
                                        tSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Text(
                          "lassMessaage",
                          style: sfMedium(
                            tColor: AppColors.mainTextColor.withOpacity(0.75),
                            tSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () => {
        Navigator.of(context).pushNamed(AppRoutes.groupChatScreen),
      },
    );
  }
}
