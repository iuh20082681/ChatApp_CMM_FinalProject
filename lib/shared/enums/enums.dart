import 'package:json_annotation/json_annotation.dart';

enum GroupChatType {
  baseGroupChat,
  advancedGroupChat,
}

enum USERSTATUS {
  @JsonValue("ACTIVE")
  active,
  @JsonValue("INACTIVE")
  inactive,
  @JsonValue("TERMINATED")
  terminated,
}
