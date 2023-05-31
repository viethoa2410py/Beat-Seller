import 'package:beatSeller/blocs/app_bloc.dart';
import 'package:beatSeller/blocs/bloc.dart';
import 'package:beatSeller/global/constant/color.dart';
import 'package:beatSeller/repository/repository.dart';
import 'package:beatSeller/screens/auth/register_page.dart';
import 'package:beatSeller/screens/root_app.dart';
import 'package:beatSeller/utils/snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beatSeller/utils/extension.dart';
import 'package:beatSeller/widgets/alert_dialog/alert_dialog_builder.dart';
import 'package:beatSeller/widgets/app_bar.dart';
import 'package:beatSeller/widgets/app_button.dart';
import 'package:beatSeller/widgets/text_input_field.dart';

class LoginPage extends StatefulWidget {
  static const id = 'LoginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.lightAppBar(
        context: context,
        titleString: "Sign In",
        showBack: false,
      ),
      body: SingleChildScrollView(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.status == AuthStatus.logged) {
              ScaffoldMessenger.of(context).showSnackBar(
                  ExpandedSnackBar.successSnackBar(context,
                      "Welcome back ${UserRepository.currentUser!.email}"));
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          'Email'.desc().marg(0, 0, 20),
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
                  password: _passwordController.text,
                ));
              }
            },
            borderRadius: BorderRadius.circular(2),
            child: 'Confirm'.buttonTitle(),
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     'Sign In With'.liteGrey().b().marg(0, 0, 30, 15),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Image.asset(AppIcons.instaLogo).square(40).rectAll(20).inkTap(
          //             onTap: () {
          //           showUnderDevelopmentFunction(context);
          //         }),
          //         SizedBox(width: 10),
          //         SvgPicture.asset(AppIcons.googleLogo)
          //             .square(40)
          //             .rectAll(20)
          //             .inkTap(onTap: () {
          //           showUnderDevelopmentFunction(context);
          //         }),
          //         SizedBox(width: 10),
          //         Image.asset(AppIcons.facebookLogo)
          //             .square(40)
          //             .rectAll(20)
          //             .inkTap(onTap: () {
          //           showUnderDevelopmentFunction(context);
          //         }),
          //       ],
          //     ),
          //   ],
          // ).marg(16, 0),
          'Do not have account?'
              .plain()
              .color(AppColors.textSecondary)
              .b()
              .inkTap(onTap: () {
                Navigator.push(
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
