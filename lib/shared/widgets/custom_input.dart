import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/styles/app_colors.dart';
import '../../configs/styles/app_text_styles.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

class CustomInput extends StatefulWidget {
  final String? hintText;
  final FocusNode? focusNode;
  final bool isSecure;
  final TextEditingController controller;
  final bool isEmailInput;

  const CustomInput({
    super.key,
    this.hintText,
    this.focusNode,
    required this.isEmailInput,
    required this.isSecure,
    required this.controller,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isShow = false;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return widget.isEmailInput
        ? BlocListener<AuthBloc, AuthState>(
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
              if (state is EmailCheckSucceed) {
                if (state.user!.email != null) {
                  setState(() {
                    errorText = "Email này đã được đăng ký!";
                  });
                } else {
                  setState(() {
                    errorText = null;
                  });
                }
              }
            },
            child: TextField(
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
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorText: errorText,
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
              onChanged: (value) {
                if (widget.isEmailInput) {
                  if (widget.controller.text.isNotEmpty) {
                    BlocProvider.of<AuthBloc>(context).add(
                      CheckEmailRequested(
                        email: widget.controller.text,
                      ),
                    );
                  }
                }
              },
            ),
          )
        : TextField(
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
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              errorText: errorText,
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
