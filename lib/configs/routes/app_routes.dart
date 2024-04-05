import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/forgot_password_screen.dart';
import '../../features/auth/presentation/pages/initial_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/register_screen.dart';
import '../../features/auth/presentation/pages/register_succeed_screen.dart';
import '../../features/auth/presentation/pages/vertify_registry_screen.dart';
import '../../features/chat/presentation/pages/chat_manager_screen.dart';
import '../../features/chat/presentation/pages/group_chat_screen.dart';
import '../../features/chat/presentation/pages/single_chat_screen.dart';

class AppRoutes {
  // Auth routes
  static String initialScreen = './initial_route';
  static String loginScreen = './login_route';
  static String registerScreen = './register_route';
  static String forgotPasswordScreen = './forgot_password_route';
  static String registerSucceedScreen = './register_succeed_route';
  static String vertifyRegistryScreen = './vertify_registry_route';

  // Chat routes
  static String chatManagerScreen = './chat_manager_route';
  static String singleChatScreen = './single_chat_screen';
  static String groupChatScreen = './group_chat_screen';
}

Map<String, Widget Function(BuildContext)> buildRoutes() {
  return {
    AppRoutes.initialScreen: (_) => const InitialScreen(),
    AppRoutes.loginScreen: (_) => const LoginScreen(),
    AppRoutes.registerScreen: (_) => const RegisterScreen(),
    AppRoutes.forgotPasswordScreen: (_) => const ForgotPasswordScreen(),
    AppRoutes.registerSucceedScreen: (_) => const RegisterSucceedScreen(),
    AppRoutes.chatManagerScreen: (_) => const ChatManagerScreen(),
    AppRoutes.singleChatScreen: (_) => const SingleChatScreen(),
    AppRoutes.groupChatScreen: (_) => const GroupChatScreen(),
    AppRoutes.vertifyRegistryScreen: (_) => const VertifyRegistryScreen(),
  };
}
