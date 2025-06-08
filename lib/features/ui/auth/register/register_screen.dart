import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  /*TextEditingController nameController = TextEditingController(
    text: "Nada Nasr",
  );
  TextEditingController mobileController = TextEditingController(
    text: "01007687534",
  );
  TextEditingController emailController = TextEditingController(
    text: "nada@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "1234567899",
  );
  TextEditingController rePasswordController = TextEditingController(
    text: "1234567899",
  );
  var formKey = GlobalKey<FormState>();
  */

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingStates) {
          DialogUtils.showLoading(
            context: context,
            message: 'Loading...',
          );
        } else if (state is RegisterErrorStates) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.errors.errorMessage,
              title: 'Error',
              posActionName: 'Ok'
          );
        } else if (state is RegisterSuccessStates) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Register Successfully',
              title: 'Success',
              posActionName: 'Ok'
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    top: 85.h,
                    bottom: 80.h,
                    left: 96.w,
                    right: 96.w,
                  ),
                  child: Image.asset(AppAssets.routeLogo),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Form(
                        key: viewModel.formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('Full Name', style: AppStyles.medium18White),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                hintText: 'enter your full name',
                                hintStyle: AppStyles.light18HintText,
                                controller: viewModel.fullNameController,
                                filledColor: AppColors.whiteColor,
                                validator: (text) {
                                  AppValidators.validateFullName(
                                    viewModel.fullNameController.text,
                                  );
                                  return null;
                                },
                              ),
                              SizedBox(height: 20.h),
                              Text('Mobile Number',
                                  style: AppStyles.medium18White),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                keyboardInputType: TextInputType.number,
                                filledColor: AppColors.whiteColor,
                                hintText: 'enter your mobile number',
                                hintStyle: AppStyles.light18HintText,
                                controller: viewModel.phoneController,
                                validator: (text) {
                                  AppValidators.validatePhoneNumber(
                                      viewModel.phoneController.text
                                  );
                                  return null;
                                },
                              ),
                              SizedBox(height: 20.h),
                              Text('E-mail address',
                                  style: AppStyles.medium18White),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                keyboardInputType: TextInputType.emailAddress,
                                filledColor: AppColors.whiteColor,
                                hintText: 'enter your email address',
                                hintStyle: AppStyles.light18HintText,
                                controller: viewModel.emailController,
                                validator: (text) {
                                  AppValidators.validateEmail(
                                      viewModel.emailController.text
                                  );
                                  return null;
                                },
                              ),
                              SizedBox(height: 20.h),
                              Text('Password', style: AppStyles.medium18White),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                keyboardInputType: TextInputType
                                    .visiblePassword,
                                obscureText: true,
                                filledColor: AppColors.whiteColor,
                                hintText: 'enter your password',
                                hintStyle: AppStyles.light18HintText,
                                suffixIcon: Image.asset(
                                  AppAssets.iconShowPassword,
                                ),
                                controller: viewModel.passwordController,
                                validator: (text) {
                                  AppValidators.validatePassword(
                                      viewModel.passwordController.text
                                  );
                                  return null;
                                },
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                  'RePassword', style: AppStyles.medium18White),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                keyboardInputType: TextInputType
                                    .visiblePassword,
                                obscureText: true,
                                filledColor: AppColors.whiteColor,
                                hintText: 'enter your password',
                                hintStyle: AppStyles.light18HintText,
                                suffixIcon: Image.asset(
                                  AppAssets.iconShowPassword,
                                ),
                                controller: viewModel.rePasswordController,
                                validator: (text) {
                                  AppValidators.validateConfirmPassword(
                                      viewModel.rePasswordController.text,
                                      viewModel.passwordController.text);
                                  return null;
                                },
                              ),
                              SizedBox(height: 40.h),
                              CustomElevatedButton(
                                onButtonClick: viewModel.register,
                                text: 'Sign up',
                                backgroundColor: AppColors.whiteColor,
                                textStyle: AppStyles.semi20Primary,
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: AppStyles.medium18White,
                                  ),
                                  TextButton(
                                    child: Text(
                                      'login',
                                      style: AppStyles.medium18White,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen(),
                                        ),
                                            (route) => false,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.h),
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
