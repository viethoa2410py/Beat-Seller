import 'package:beatSeller/blocs/app_bloc.dart';
import 'package:beatSeller/blocs/bloc.dart';
import 'package:beatSeller/global/constant/color.dart';
import 'package:beatSeller/repository/repository.dart';
import 'package:beatSeller/screens/auth/login_page.dart';
import 'package:beatSeller/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beatSeller/utils/extension.dart';
import 'package:beatSeller/widgets/alert_dialog/alert_dialog_builder.dart';
import 'package:beatSeller/widgets/app_bar.dart';
import 'package:beatSeller/widgets/app_button.dart';
import 'package:beatSeller/widgets/text_input_field.dart';

import '../root_app.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return buildUI();
    }, listener: (context, state) {
      if (state.status == AuthStatus.logged) {
        ScaffoldMessenger.of(context).showSnackBar(
            ExpandedSnackBar.successSnackBar(
                context, "Welcome back ${UserRepository.currentUser!.email}"));
        Navigator.pushReplacementNamed(context, RootApp.id);
      }
      if (state.status == AuthStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
            ExpandedSnackBar.failureSnackBar(context, state.errorString!));
      }
      if (state.status == AuthStatus.loading) {
        showLoadingDialog();
      } else {
        closeLoading();
      }
      if (state.status == AuthStatus.logged) {
        Navigator.pushReplacementNamed(context, RootApp.id);
      }
    });
  }

  Widget buildUI() {
    return Scaffold(
      appBar: BaseAppBar.lightAppBar(context: context, titleString: "Register"),
      body: _registerForm(),
    ).unfocus();
  }

  Widget _registerForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Email'.desc(),
          AppTextInputField.authVisibleInputText(
            controller: _emailController,
            inputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Input your mail";
              }
              return null;
            },
          ).marg(0, 0, 6, 20),
          'Display Name'.desc(),
          AppTextInputField.authVisibleInputText(
            controller: _displayNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Input your display name";
              }
              return null;
            },
          ).marg(0, 0, 6, 20),
          'Password'.desc(),
          AppTextInputField.authObscureInputText(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Input your password";
              }

              return null;
            },
          ).marg(0, 0, 6, 20),
          'Confirm Password'.desc(),
          AppTextInputField.authObscureInputText(
            controller: _rePasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Input confirm password";
              }
              if (value != _passwordController.text) {
                return "Confirm password is incorrect";
              }
              return null;
            },
          ).marg(0, 0, 6, 20),
          AppButton.primary(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                AppBloc.authenticationBloc.add(Register(
                    email: _emailController.text,
                    password: _passwordController.text,
                    displayName: _displayNameController.text));
              }
            },
            borderRadius: BorderRadius.circular(2),
            child: 'Confirm'.buttonTitle(),
          ),
          // Center(
          //   child: SizedBox(
          //     width: 160,
          //     child: Column(
          //       children: [
          //         'Register With'.liteGrey().b().marg(0, 0, 30, 15),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Image.asset(AppIcons.instaLogo)
          //                 .square(40)
          //                 .rectAll(20)
          //                 .inkTap(onTap: () {
          //               showUnderDevelopmentFunction(context);
          //             }),
          //             SvgPicture.asset(AppIcons.googleLogo)
          //                 .square(40)
          //                 .rectAll(20)
          //                 .inkTap(onTap: () {
          //               showUnderDevelopmentFunction(context);
          //             }),
          //             Image.asset(AppIcons.facebookLogo)
          //                 .square(40)
          //                 .rectAll(20)
          //                 .inkTap(onTap: () {
          //               showUnderDevelopmentFunction(context);
          //             }),
          //           ],
          //         ),
          //       ],
          //     ).marg(16, 0),
          //   ),
          // ),
          'Already have an account?'
              .plain()
              .color(AppColors.textSecondary)
              .b()
              .inkTap(onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              })
              .center()
              .marg(
                0,
                0,
                28,
              ),
        ],
      ).marg(0, 16)),
    );
  }
}
