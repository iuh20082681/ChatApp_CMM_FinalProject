import 'package:flutter/material.dart';

import '../../configs/styles/app_colors.dart';
import '../../configs/styles/app_text_styles.dart';

class CustomInput extends StatefulWidget {
  String? hintText;
  FocusNode? focusNode;
  final bool isSecure;
  final TextEditingController controller;

  CustomInput({
    super.key,
    this.hintText,
    this.focusNode,
    required this.isSecure,
    required this.controller,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: sfRegular(
        tColor: AppColors.mainTextColor,
        tSize: 15,
      ),
      autofocus: true,
      focusNode: widget.focusNode,
      obscureText: widget.isSecure ? !isShow : false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        filled: true,
        fillColor: AppColors.regularGray,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryThemeColor),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderGray),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: widget.hintText,
        hintStyle: sfRegular(
          tColor: AppColors.mediumGray,
          tSize: 15,
        ),
        suffixIcon: widget.isSecure
            ? IconButton(
                icon: Icon(
                  !isShow
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () => {
                  setState(() {
                    isShow = !isShow;
                  })
                },
              )
            : null,
      ),
      onTapOutside: (event) => {
        FocusManager.instance.primaryFocus?.unfocus(),
      },
    );
  }
}
