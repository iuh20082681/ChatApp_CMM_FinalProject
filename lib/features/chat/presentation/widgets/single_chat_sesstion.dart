import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';

class SingleChatSession extends StatefulWidget {
  final bool isSingleChat;
  final bool isPin;
  final String lastTimeActive;
  final String chatUserName;
  final String lastMessage;
  final String imgUrl;

  const SingleChatSession(
      {Key? key,
      required this.isSingleChat,
      required this.lastTimeActive,
      required this.chatUserName,
      required this.lastMessage,
      required this.imgUrl,
      required this.isPin})
      : super(key: key);

  @override
  _SingleChatSessionState createState() => _SingleChatSessionState();
}

class _SingleChatSessionState extends State<SingleChatSession> {
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
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 27,
                  child: CircleAvatar(
                    backgroundColor: Colors.amber,
                    backgroundImage: NetworkImage(widget.imgUrl, scale: 1),
                    radius: 25,
                  ),
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
                              widget.chatUserName,
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
                              padding: EdgeInsets.only(right: 15),
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
                                    widget.lastTimeActive,
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
                          widget.lastMessage,
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
        Navigator.of(context).pushNamed(AppRoutes.singleChatScreen),
      },
    );
  }
}
