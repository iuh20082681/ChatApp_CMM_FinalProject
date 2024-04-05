import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';
import '../../../../shared/widgets/custom_input.dart';
import '../../../../shared/widgets/submit_button.dart';
import '../bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? confirmPasswordErr;
  bool showConfirmPassword = true;
  bool showPassword = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
          "Tạo tài khoản mới",
          style: sfBold(
            tColor: AppColors.mainTextColor,
            tSize: 24,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 20,
            ),
            child: Column(
              children: [
                CustomInput(
                  isSecure: false,
                  controller: _emailController,
                  hintText: "Email",
                  isEmailInput: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInput(
                  isSecure: false,
                  controller: _userNameController,
                  hintText: "Tên Yolo",
                  isEmailInput: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _passwordController,
                  style: sfRegular(
                    tColor: AppColors.mainTextColor,
                    tSize: 15,
                  ),
                  autofocus: true,
                  obscureText: showPassword,
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
                      errorText: null,
                      hintText: "Mật khẩu",
                      hintStyle: sfRegular(
                        tColor: AppColors.mediumGray,
                        tSize: 15,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () => {
                          setState(() {
                            showPassword = !showPassword;
                          })
                        },
                      )),
                  onTapOutside: (event) => {
                    FocusManager.instance.primaryFocus?.unfocus(),
                  },
                  onChanged: (value) {
                    if (_confirmPasswordController.text.isNotEmpty &&
                        (_confirmPasswordController.text !=
                            _passwordController.text)) {
                      setState(() {
                        confirmPasswordErr =
                            "Mật khẩu xác nhận không chính xác!";
                      });
                    } else {
                      setState(() {
                        confirmPasswordErr = null;
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _confirmPasswordController,
                  style: sfRegular(
                    tColor: AppColors.mainTextColor,
                    tSize: 15,
                  ),
                  autofocus: true,
                  obscureText: showConfirmPassword,
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
                      errorText: confirmPasswordErr,
                      hintText: "Xác nhận mật khẩu",
                      hintStyle: sfRegular(
                        tColor: AppColors.mediumGray,
                        tSize: 15,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          showConfirmPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () => {
                          setState(() {
                            showConfirmPassword = !showConfirmPassword;
                          })
                        },
                      )),
                  onTapOutside: (event) => {
                    FocusManager.instance.primaryFocus?.unfocus(),
                  },
                  onChanged: (value) {
                    if (_confirmPasswordController.text !=
                        _passwordController.text) {
                      setState(() {
                        confirmPasswordErr =
                            "Mật khẩu xác nhận không chính xác!";
                      });
                    } else {
                      setState(() {
                        confirmPasswordErr = null;
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                // SubmitButton(
                //   text: "Đăng kí ngay",
                //   textStyle: sfSemibold(tColor: Colors.white, tSize: 15),
                //   bgColor: AppColors.primaryThemeColor,
                //   event: () => {
                //     if (_emailController.text.trim().isNotEmpty &&
                //         _userNameController.text.trim().isNotEmpty &&
                //         _passwordController.text.trim().isNotEmpty &&
                //         _confirmPasswordController.text.trim().isNotEmpty &&
                //         confirmPasswordErr == null)
                //       {
                //         Navigator.of(context)
                //             .pushNamed(AppRoutes.vertifyRegistryScreen),
                //       }
                //   },
                // )
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is RegisterSucceed) {
                      Navigator.of(context)
                          .popAndPushNamed(AppRoutes.registerSucceedScreen);
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is RegisterLoading) {
                          return SubmitButton(
                            text: "Đăng kí ngay",
                            customChild: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            textStyle:
                                sfSemibold(tColor: Colors.white, tSize: 15),
                            bgColor: AppColors.primaryThemeColor,
                            event: () => {
                              BlocProvider.of<AuthBloc>(context).add(
                                RegisterRequested(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  passwordConfirm:
                                      _confirmPasswordController.text.trim(),
                                  name: _userNameController.text.trim(),
                                ),
                              ),
                            },
                          );
                        }
                        return SubmitButton(
                          text: "Đăng kí ngay",
                          textStyle:
                              sfSemibold(tColor: Colors.white, tSize: 15),
                          bgColor: AppColors.primaryThemeColor,
                          event: () => {
                            if (_emailController.text.trim().isNotEmpty &&
                                _userNameController.text.trim().isNotEmpty &&
                                _passwordController.text.trim().isNotEmpty &&
                                _confirmPasswordController.text
                                    .trim()
                                    .isNotEmpty &&
                                confirmPasswordErr == null)
                              {
                                BlocProvider.of<AuthBloc>(context).add(
                                  RegisterRequested(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                    passwordConfirm:
                                        _confirmPasswordController.text.trim(),
                                    name: _userNameController.text.trim(),
                                  ),
                                ),
                              }
                          },
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
