import 'package:flutter/material.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';
import '../../../../shared/widgets/submit_button.dart';

class RegisterSucceedScreen extends StatelessWidget {
  const RegisterSucceedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const imgSuccess = 'assets/imgs/success_img.png';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  imgSuccess,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Đăng ký thành công",
                  style: sfBold(
                    tColor: AppColors.mainTextColor,
                    tSize: 28,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SubmitButton(
                    text: "Trở lại đăng nhập",
                    textStyle: sfSemibold(
                      tColor: Colors.white,
                      tSize: 17,
                    ),
                    bgColor: AppColors.primaryThemeColor,
                    event: () => {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.loginScreen)
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
