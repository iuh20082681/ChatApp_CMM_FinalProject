import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';
import '../../../../shared/widgets/custom_input.dart';
import '../../../../shared/widgets/submit_button.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isValidEmailAndPassword = true;
  bool isValidEmail = true;

  String? errorText;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            child: DecoratedBox(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.lightGray),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ),
        title: Text(
          "Đăng nhập",
          style: sfBold(
            tColor: AppColors.mainTextColor,
            tSize: 24,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: isValidEmailAndPassword
                    ? null
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email hoặc mật khẩu không hợp lệ!!!",
                              style: sfRegular(
                                tColor: Colors.red,
                                tSize: 14,
                              ),
                            ),
                            Text(
                              "Vui lòng thử lại.",
                              style: sfRegular(
                                tColor: Colors.red,
                                tSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is ValidateEmailSuccess) {
                    setState(() {
                      errorText = null;
                    });
                  }
                  if (state is ValidateEmailFailed) {
                    setState(() {
                      errorText = state.error;
                    });
                  }
                },
                child: TextField(
                  controller: _emailController,
                  style: sfRegular(
                    tColor: AppColors.mainTextColor,
                    tSize: 15,
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      filled: true,
                      fillColor: AppColors.regularGray,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.primaryThemeColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.borderGray),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorText: errorText,
                      hintText: "Email",
                      hintStyle: sfRegular(
                        tColor: AppColors.mediumGray,
                        tSize: 15,
                      )),
                  onTapOutside: (event) => {
                    FocusManager.instance.primaryFocus?.unfocus(),
                  },
                  onChanged: (value) {
                    if (_emailController.text.isNotEmpty) {
                      BlocProvider.of<AuthBloc>(context).add(
                        CheckEmailRequested(
                          email: _emailController.text,
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                hintText: "Mật khẩu",
                isSecure: true,
                controller: _passwordController,
                isEmailInput: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.forgotPasswordScreen)
                  },
                  child: Text(
                    "Quên mật khẩu?",
                    style: sfSemibold(
                      tColor: AppColors.mainTextColor,
                      tSize: 14,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is UnAuthenticated) {
                    return SubmitButton(
                      text: "Đăng nhập",
                      textStyle: sfSemibold(tColor: Colors.white, tSize: 17),
                      bgColor: AppColors.primaryThemeColor,
                      event: () => {
                        if (_emailController.text.trim().isNotEmpty &&
                            _passwordController.text.trim().isNotEmpty)
                          {
                            BlocProvider.of<AuthBloc>(context).add(
                              LoginRequested(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              ),
                            )
                          }
                      },
                    );
                  }
                  if (state is LoginLoading) {
                    return SubmitButton(
                      text: "",
                      textStyle: sfSemibold(tColor: Colors.white, tSize: 17),
                      bgColor: AppColors.primaryThemeColor,
                      customChild: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                      event: () => {},
                    );
                  }
                  return const SizedBox();
                },
                listener: (context, state) {
                  if (state is LoginSucceed) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.chatManagerScreen,
                      (route) => false,
                    );
                  }

                  if (state is LoginFailed) {
                    setState(() {
                      isValidEmailAndPassword = false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
