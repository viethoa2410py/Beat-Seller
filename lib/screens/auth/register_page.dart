import 'package:hotel_booking/blocs/app_bloc.dart';
import 'package:hotel_booking/blocs/bloc.dart';
import 'package:hotel_booking/global/constant/color.dart';
import 'package:hotel_booking/global/constant/icons.dart';
import 'package:hotel_booking/repository/repository.dart';
import 'package:hotel_booking/screens/auth/login_page.dart';
import 'package:hotel_booking/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/utils/extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/widgets/alert_dialog/alert_dialog_builder.dart';
import 'package:hotel_booking/widgets/app_bar.dart';
import 'package:hotel_booking/widgets/app_button.dart';
import 'package:hotel_booking/widgets/text_input_field.dart';

import '../root_app.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return buildUI();
    }, listener: (context, state) {
      if (state.status == AuthStatus.logged) {
        ScaffoldMessenger.of(context).showSnackBar(
            ExpandedSnackBar.successSnackBar(
                context, "Welcome back " + UserRepository.currentUser!.email));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RootApp()),
        );
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RootApp()),
        );
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
          'Email'.desc().marg(0, 0, 20),
          AppTextInputField.authVisibleInputText(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Input your mail";
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
          AppButton.primary(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                AppBloc.authenticationBloc.add(Register(
                    email: _emailController.text,
                    password: _passwordController.text));
              }
            },
            child: 'Confirm'.buttonTitle(),
            borderRadius: BorderRadius.circular(2),
          ),
          Center(
            child: SizedBox(
              width: 160,
              child: Column(
                children: [
                  'Register With'.liteGrey().b().marg(0, 0, 30, 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppIcons.instaLogo)
                          .square(40)
                          .rectAll(20)
                          .inkTap(onTap: () {
                        showUnderDevelopmentFunction(context);
                      }),
                      SvgPicture.asset(AppIcons.googleLogo)
                          .square(40)
                          .rectAll(20)
                          .inkTap(onTap: () {
                        showUnderDevelopmentFunction(context);
                      }),
                      Image.asset(AppIcons.facebookLogo)
                          .square(40)
                          .rectAll(20)
                          .inkTap(onTap: () {
                        showUnderDevelopmentFunction(context);
                      }),
                    ],
                  ),
                ],
              ).marg(16, 0),
            ),
          ),
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
