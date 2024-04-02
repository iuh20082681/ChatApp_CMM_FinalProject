import 'package:flutter/material.dart';

import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';
import '../../../../shared/widgets/custom_input.dart';
import '../../../../shared/widgets/submit_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _textEditingController = TextEditingController();

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
          "Quên mật khẩu",
          style: sfBold(
            tColor: AppColors.mainTextColor,
            tSize: 24,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          child: Column(
            children: [
              CustomInput(
                isSecure: false,
                controller: _textEditingController,
                hintText: "Email",
              ),
              const SizedBox(
                height: 25,
              ),
              SubmitButton(
                  text: "Đăng nhập",
                  textStyle: sfSemibold(tColor: Colors.white, tSize: 17),
                  bgColor: AppColors.primaryThemeColor,
                  event: () => {})
            ],
          ),
        ),
      ),
    );
  }
}
