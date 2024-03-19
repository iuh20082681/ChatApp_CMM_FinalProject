import 'package:flutter/material.dart';
import '../features/auth/presentation/pages/initial_page.dart';

class AppRoutes {
  static String initialPage = './initial_route';
}

Map<String, Widget Function(BuildContext)> buildRoutes() {
  return {AppRoutes.initialPage: (_) => const InitialPage()};
}
