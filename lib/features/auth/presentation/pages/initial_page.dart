import 'package:flutter/material.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_text_styles.dart';
import '../../../../shared/widgets/custom_outline_button.dart';
import '../../../../shared/widgets/submit_button.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    const topPage = 'assets/imgs/top_page.png';
    const bottomPage = 'assets/imgs/bottom_page.png';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  topPage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    Flexible(
                        flex: 3,
                        fit: FlexFit.tight,
                        child: Align(
                          child: Text(
                            'DALO',
                            style: sfBold(
                              tColor: AppColors.mainTextColor,
                              tSize: 40,
                            ),
                          ),
                        )),
                    Flexible(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: Column(
                          children: [
                            SubmitButton(
                              text: "Đăng nhập",
                              textStyle: sfSemibold(
                                tColor: Colors.white,
                                tSize: 17,
                              ),
                              bgColor: AppColors.primaryThemeColor,
                              event: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.loginPage);
                              },
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            CustomOutlineButton(
                              text: "Tạo tài khoản mới",
                              textStyle: sfSemibold(
                                  tColor: AppColors.mainTextColor, tSize: 17),
                              bgColor: Colors.white,
                              borderColor: AppColors.primaryThemeColor,
                              event: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.loginPage);
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  bottomPage,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
