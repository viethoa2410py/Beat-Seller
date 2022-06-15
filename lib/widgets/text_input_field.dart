import 'package:hotel_booking/global/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/extension.dart';
// import 'package:famly/constants/colors.dart';
// import 'package:famly/util/extension/extension.dart';

class AppTextInputField extends StatefulWidget {
  const AppTextInputField._(
      {required this.controller,
      required this.isObscureTextInput,
      this.hintText,
      this.hintTextStyle,
      this.contentPadding,
      this.outlineInputBorder,
      this.enable,
      this.inputType,
      this.height,
      this.initialInputValue,
      this.style,
      this.onChanged,
      this.validator});

  factory AppTextInputField.authVisibleInputText(
      {required TextEditingController controller,
      EdgeInsets? contentPadding,
      OutlineInputBorder? outlineInputBorder,
      bool? enable,
      double? height,
      TextInputType? inputType,
      String? hintText,
      TextStyle? hintTextStyle,
      TextStyle? style,
      String? initialInputValue,
      Function(String?)? onChanged,
      String? Function(String?)? validator}) {
    return AppTextInputField._(
      isObscureTextInput: false,
      controller: controller,
      contentPadding: contentPadding,
      outlineInputBorder: outlineInputBorder,
      enable: enable,
      height: height,
      inputType: inputType,
      validator: validator,
      initialInputValue: initialInputValue,
      hintText: hintText,
      hintTextStyle: hintTextStyle,
      style: style,
      onChanged: onChanged,
    );
  }

  factory AppTextInputField.authObscureInputText(
      {required TextEditingController controller,
      EdgeInsets? contentPadding,
      OutlineInputBorder? outlineInputBorder,
      bool? enable,
      double? height,
      TextInputType? inputType,
      String? hintText,
      TextStyle? hintTextStyle,
      TextStyle? style,
      String? initialInputValue,
      Function(String?)? onChanged,
      String? Function(String?)? validator}) {
    return AppTextInputField._(
      isObscureTextInput: true,
      controller: controller,
      contentPadding: contentPadding,
      outlineInputBorder: outlineInputBorder,
      enable: enable,
      height: height ,
      inputType: inputType,
      validator: validator,
      initialInputValue: initialInputValue,
      hintText: hintText,
      hintTextStyle: hintTextStyle,
      style: style,
      onChanged: onChanged,
    );
  }

  factory AppTextInputField.base(
      {required TextEditingController controller,
      EdgeInsets? contentPadding,
      OutlineInputBorder? outlineInputBorder,
      bool? enable,
      double? height,
      TextInputType? inputType,
      String? hintText,
      TextStyle? hintTextStyle,
      TextStyle? style,
      String? initialInputValue,
      Function(String?)? onChanged,
      String? Function(String?)? validator}) {
    return AppTextInputField._(
      isObscureTextInput: true,
      controller: controller,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      outlineInputBorder: outlineInputBorder,
      enable: enable,
      height: height ?? 36,
      inputType: inputType,
      validator: validator,
      initialInputValue: initialInputValue,
      hintText: hintText,
      hintTextStyle: hintTextStyle,
      style: style,
      onChanged: onChanged,
    );
  }

  final TextEditingController controller;

  final bool isObscureTextInput;

  final bool? enable;

  final double? height;

  final EdgeInsets? contentPadding;

  final OutlineInputBorder? outlineInputBorder;

  final String? Function(String?)? validator;

  final TextInputType? inputType;

  final String? initialInputValue;

  final String? hintText;

  final TextStyle? hintTextStyle;

  final TextStyle? style;

  final Function(String?)? onChanged;
  @override
  State<AppTextInputField> createState() => _AppTextInputFieldState();
}

class _AppTextInputFieldState extends State<AppTextInputField> {
  bool? _isObscurePassword;
  final BorderRadius kDefaultBorder =
      const BorderRadius.all(Radius.circular(2));
  final GlobalKey<FormFieldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _isObscurePassword = widget.isObscureTextInput;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: widget.height ?? 0,
      ),
      child: TextFormField(
        key: _key,
        initialValue: widget.initialInputValue,
        keyboardType: widget.inputType,
        enabled: widget.enable ?? true,
        controller: widget.controller,
        obscureText: _isObscurePassword ?? false,
        obscuringCharacter: '*',
        validator: widget.validator,
        onChanged: widget.onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: widget.outlineInputBorder ??
              OutlineInputBorder(
                  borderRadius: kDefaultBorder,
                  borderSide: BorderSide(color: AppColors.redError, width: 1)),
          isDense: true,
          hintText: widget.hintText,
          enabledBorder: widget.outlineInputBorder ??
              OutlineInputBorder(
                  borderRadius: kDefaultBorder,
                  borderSide:
                      const BorderSide(color: AppColors.border, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: kDefaultBorder,
              borderSide:
                  const BorderSide(color: AppColors.redError, width: 1)),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(vertical: 10.5, horizontal: 14),
         
       
          suffixIcon: widget.isObscureTextInput
              ? InkWell(
                  onTap: () {
                    setState(() {
                      _isObscurePassword = !_isObscurePassword!;
                    });
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Icon(
                      (_isObscurePassword ?? false)
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFFB5BBC9),
                      size: 16,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
