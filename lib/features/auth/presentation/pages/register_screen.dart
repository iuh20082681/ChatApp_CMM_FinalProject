import 'package:flutter/material.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';
import '../../../../shared/widgets/custom_input.dart';
import '../../../../shared/widgets/submit_button.dart';

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
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInput(
                  isSecure: false,
                  controller: _userNameController,
                  hintText: "Tên Yolo",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInput(
                  isSecure: true,
                  controller: _passwordController,
                  hintText: "Mật khẩu",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInput(
                  isSecure: true,
                  controller: _confirmPasswordController,
                  hintText: "Xác nhận mật khẩu",
                ),
                const SizedBox(
                  height: 35,
                ),
                SubmitButton(
                  text: "Đăng kí ngay",
                  textStyle: sfSemibold(tColor: Colors.white, tSize: 15),
                  bgColor: AppColors.primaryThemeColor,
                  event: () => {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.registerSucceedScreen)
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
