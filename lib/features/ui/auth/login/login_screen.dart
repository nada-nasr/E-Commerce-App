import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController(

  );
  TextEditingController passwordController = TextEditingController(

  );
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(
                  top: 91.h,
                  bottom: 87.h,
                  left: 97.w,
                  right: 97.w,
                ),
                child: Image.asset(AppAssets.routeLogo),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AutoSizeText(
                      'Welcome Back To Route',
                      style: AppStyles.semi24White,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      'Please sign in with your mail',
                      style: AppStyles.light16White,
                      maxLines: 1,
                    ),

                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 40.h),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('User Name', style: AppStyles.medium18White),
                            SizedBox(height: 20.h),
                            CustomTextField(
                              hintText: 'enter your name',
                              hintStyle: AppStyles.light18HintText,
                              controller: userNameController,
                              filledColor: AppColors.whiteColor,
                              validator: (text) {
                                AppValidators.validateUsername(
                                  userNameController.text,
                                );
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),
                            Text('Password', style: AppStyles.medium18White),
                            SizedBox(height: 20.h),
                            CustomTextField(
                              keyboardInputType: TextInputType.visiblePassword,
                              obscureText: true,
                              filledColor: AppColors.whiteColor,
                              hintText: 'enter your password',
                              hintStyle: AppStyles.light18HintText,
                              suffixIcon: Image.asset(
                                AppAssets.iconShowPassword,
                              ),
                              controller: passwordController,
                              validator: (text) {
                                AppValidators.validatePassword(
                                    passwordController.text
                                );
                                return null;
                              },
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot password',
                                  style: AppStyles.regular18White,
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h),
                            CustomElevatedButton(
                              onButtonClick: login,
                              text: 'Login',
                              backgroundColor: AppColors.whiteColor,
                              textStyle: AppStyles.semi20Primary,
                            ),
                            SizedBox(height: 20.h),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don’t have an account?',
                                    style: AppStyles.medium18White,
                                  ),
                                  TextButton(
                                    child: Text(
                                      'Create Account',
                                      style: AppStyles.medium18White,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      //todo: login logic
    }
  }
}
