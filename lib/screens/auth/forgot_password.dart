import 'dart:async';

import 'package:beatSeller/blocs/app_bloc.dart';
import 'package:beatSeller/blocs/bloc.dart';
import 'package:beatSeller/utils/extension.dart';
import 'package:beatSeller/widgets/app_bar.dart';
import 'package:beatSeller/widgets/app_button.dart';
import 'package:beatSeller/widgets/custom_textfield/configs/textfield_config.dart';
import 'package:beatSeller/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isSentCode = false;
  bool isReSentCode = false;
  bool showMore = false;
  int countDownSenCode = 30;
  resendCode() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countDownSenCode--;
      });
      if (countDownSenCode <= 0) {
        setState(() {
          isReSentCode = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.lightAppBar(
        context: context,
        titleString: "Forgot Password",
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              'Email'.desc().marg(0, 0, 20),
              AppTextInputField.authVisibleInputText(
                controller: _emailController,
                inputType: TextInputType.emailAddress,
                enable: !isSentCode,
                validator: (value) {
                  return TextFieldValidatorUtils.validateEmail(value);
                },
              ).marg(0, 0, 6, 20),
              AppButton.primary(
                onTap: () {
                  setState(() {
                    isSentCode = true;
                    countDownSenCode = 30;
                    isReSentCode = false;
                    showMore = true;
                  });
                  resendCode();
                  AppBloc.authenticationBloc.add(SendCode(
                    email: _emailController.text,
                  ));
                },
                disableButton: isSentCode && !isReSentCode,
                backgroundColor: isSentCode && !isReSentCode
                    ? Colors.grey.shade300
                    : const Color(0xFF444444),
                borderRadius: BorderRadius.circular(2),
                child: isSentCode
                    ? 'Resend code ${countDownSenCode > 0 ? ' ($countDownSenCode)s' : ''}'
                        .buttonTitle()
                    : 'Send code'.buttonTitle(),
              ),
              const SizedBox(
                height: 20,
              ),
              if (showMore) ...[
                'We sent a password reset email to your email address. Please check it.'
                    .desc()
                    .marg(0, 0, 20),
              ],
            ],
          ).marg(0, 16),
        ),
      ),
    );
  }
}
