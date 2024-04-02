import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  void _logOutRequested() {
    BlocProvider.of<AuthBloc>(context).add(LogOutRequested());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UnAuthenticated) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.initialScreen,
                  (route) => false,
                );
              }
            },
            builder: (context, state) {
              if (state is Authenticated) {
                return Text(state.email);
              }
              return const SizedBox();
            },
          ),
          SizedBox(
            height: 200,
          ),
          SizedBox(
            child: InkWell(
              child: Icon(Icons.logout),
              onTap: () => {
                _logOutRequested(),
              },
            ),
          ),
        ],
      ),
    );
  }
}
