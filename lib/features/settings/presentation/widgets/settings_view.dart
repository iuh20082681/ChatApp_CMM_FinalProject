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
    return Center(
      heightFactor: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text(state.user!.email![0].toUpperCase()),
                      ),
                      Text(state.user!.profile!.name!),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              child: InkWell(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Đăng xuất"),
                  ),
                ),
                onTap: () => {
                  _logOutRequested(),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
