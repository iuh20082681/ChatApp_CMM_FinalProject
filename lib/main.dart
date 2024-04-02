import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'configs/routes/app_routes.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'services_locator.dart';

void main() async {
  await setUpDI();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: buildRoutes(),
      initialRoute: AppRoutes.initialScreen,
    );
  }
}
