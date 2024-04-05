import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';

class VertifyRegistryScreen extends StatefulWidget {
  const VertifyRegistryScreen({super.key});

  @override
  _VertifyRegistryScreenState createState() => _VertifyRegistryScreenState();
}

class _VertifyRegistryScreenState extends State<VertifyRegistryScreen> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromARGB(255, 193, 199, 205)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
          child: Center(
            heightFactor: double.infinity,
            child: Column(
              children: [
                Text(
                  "Vui lòng xác nhận!",
                  style: sfBold(tColor: AppColors.mainTextColor, tSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Hãy nhập mã OTP được gửi tới email bên dưới",
                  style: sfRegular(tColor: AppColors.fadeGray, tSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "tri100@gmail.com",
                  style: sfSemibold(tColor: AppColors.mainTextColor, tSize: 18),
                ),
                const SizedBox(
                  height: 40,
                ),
                Pinput(
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyDecorationWith(
                    border: Border.all(color: AppColors.primaryThemeColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Không nhận được mã?",
                  style:
                      sfRegular(tColor: AppColors.primaryThemeColor, tSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Gửi lại mã",
                  style:
                      sfRegular(tColor: AppColors.primaryThemeColor, tSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
