import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../utils/sizer.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;

  bool passwordVisible;

  late String labelText;

  late String hintText;
  String? Function(String? value) onSaved;
  String? Function(String? value) validator;
  VoidCallback obscuringFunction;
  String? Function(String? value)? onChanged;
  late TextInputType keyboardType;
  int? maxLines;
  Widget? suffixIcon;
  TextInputAction? textInputAction;
  int? maxLength;
  final errorStyle;
  final int? errorMaxLines;
  bool? readOnly = false;
  final TextStyle? style;
  final Color? fillColor;
  final bool? isFilled;
  final bool isValid;

  CustomTextField({
    required this.controller,
    required this.passwordVisible,
    required this.hintText,
    required this.labelText,
    required this.obscuringFunction,
    required this.validator,
    required this.keyboardType,
    required this.onSaved,
    required this.isValid,
    this.onChanged,
    this.suffixIcon,
    this.maxLines,
    this.textInputAction,
    this.errorStyle,
    this.maxLength,
    this.errorMaxLines,
    this.readOnly,
    this.style,
    this.fillColor,
    this.isFilled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizer(isWidth: true, value: 282.42),
      height: isValid
          ? sizer(isWidth: false, value: 46.11)
          : sizer(isWidth: false, value: 70.11),
      // constraints: const BoxConstraints.expand(),
      // margin: const EdgeInsets.all(10.0),
      child: TextFormField(
        maxLength: maxLength,
        style: style ??
            GoogleFonts.openSans(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
        readOnly: readOnly ?? false,
        // enableInteractiveSelection: true,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        enableSuggestions: true,

        // onChanged: onChanged,
        onFieldSubmitted: onChanged,
        onSaved: onSaved,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        enableIMEPersonalizedLearning: true,
        textInputAction: textInputAction,
        //controller: _userPasswordController,
        obscureText: !passwordVisible,
        decoration: InputDecoration(
          errorMaxLines: errorMaxLines ?? 1,
          errorStyle: const TextStyle(fontSize: 13),
          alignLabelWithHint: true,
          // helperText: " ",

          isDense: true,
          //  contentPadding: EdgeInsets.all(0),

          // contentPadding: EdgeInsets.all(0),
          suffixIconConstraints:
              const BoxConstraints(minHeight: 20, minWidth: 21),
          suffixIcon: keyboardType == TextInputType.visiblePassword
              ? IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: obscuringFunction,
                )
              : suffixIcon ?? const SizedBox(),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),

          // labelStyle: AppConfigs.textFieldLabelStyle,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          fillColor: fillColor ?? Colors.white,
          filled: isFilled ?? true,
          labelText: labelText,
          hintText: hintText,
          labelStyle: GoogleFonts.openSans(
            color: const Color(0xff988F8C),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          hintStyle: GoogleFonts.openSans(
            color: const Color(0xff988F8C),
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xff7BB3FF),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(22)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xffb41139), width: 1.0),
              borderRadius: BorderRadius.circular(22)),
          errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xffb41139), width: 1.0),
              borderRadius: BorderRadius.circular(22)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.circular(22)),
        ),
      ),
    );
  }
}
// Footer