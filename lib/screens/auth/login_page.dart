import 'package:hotel_booking/blocs/app_bloc.dart';
import 'package:hotel_booking/blocs/bloc.dart';
import 'package:hotel_booking/global/constant/color.dart';
import 'package:hotel_booking/global/constant/icons.dart';
import 'package:hotel_booking/repository/repository.dart';
import 'package:hotel_booking/screens/auth/register_page.dart';
import 'package:hotel_booking/screens/root_app.dart';
import 'package:hotel_booking/utils/snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/utils/extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/widgets/alert_dialog/alert_dialog_builder.dart';
import 'package:hotel_booking/widgets/app_bar.dart';
import 'package:hotel_booking/widgets/app_button.dart';
import 'package:hotel_booking/widgets/text_input_field.dart';

class LoginPage extends StatefulWidget {
  static const id = 'LoginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.lightAppBar(context: context, titleString: "Sign In"),
      body: SingleChildScrollView(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.status == AuthStatus.logged) {
              ScaffoldMessenger.of(context).showSnackBar(
                  ExpandedSnackBar.successSnackBar(context,
                      "Welcome back " + UserRepository.currentUser!.email));
              Navigator.pushReplacementNamed(context, RootApp.id);
            }
            if (state.status == AuthStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                  ExpandedSnackBar.failureSnackBar(
                      context, state.errorString!));
            }
            if (state.status == AuthStatus.loading) {
              showLoadingDialog();
            } else {
              closeLoading();
            }
          },
          child: _signInForm(),
        ),
      ),
    );
  }

  Widget _signInForm() {
    return Form(
      key: _formKey,
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
                AppBloc.authenticationBloc.add(Login(
                    email: _emailController.text,
                    password: _passwordController.text));
              }
            },
            child: 'Confirm'.buttonTitle(),
            borderRadius: BorderRadius.circular(2),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              'Sign In With'.liteGrey().b().marg(0, 0, 30, 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppIcons.instaLogo).square(40).rectAll(20).inkTap(
                      onTap: () {
                    showUnderDevelopmentFunction(context);
                  }),
                  SizedBox(width: 10),
                  SvgPicture.asset(AppIcons.googleLogo)
                      .square(40)
                      .rectAll(20)
                      .inkTap(onTap: () {
                    showUnderDevelopmentFunction(context);
                  }),
                  SizedBox(width: 10),
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
          'Do not have account?'
              .plain()
              .color(AppColors.textSecondary)
              .b()
              .inkTap(onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              })
              .center()
              .marg(
                0,
                0,
                28,
              ),
          'Forgot password?'
              .plain()
              .color(AppColors.textSecondary)
              .b()
              .inkTap(onTap: () {
                showUnderDevelopmentFunction(context);
              })
              .center()
              .marg(0, 0, 10)
        ],
      ).marg(0, 16),
    );
  }
}
