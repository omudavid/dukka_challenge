import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputField extends StatelessWidget {
  const AppInputField(
      {this.maxLength,
      this.autofocus = false,
      this.readOnly = false,
      this.onChanged,
      this.initialValue,
      this.label,
      this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.controller,
      required this.validator,
      this.helperText,
      this.height,
      this.hintColor,
      this.borderWidth,
      this.onTap,
      required this.onSaved,
      this.focusNode,
      this.textInputAction,
      this.onFieldSubmitted,
      this.suffixIcon,
      this.prefixIcon,
      this.autovalidate = AutovalidateMode.disabled,
      this.maxLines = 1,
      this.inputFormatters,
      this.errorText,
      this.spacerHeight,
      this.topPadding,
      this.enableInteractiveSelection = true,
      this.labelTextStyle,
      this.enable = true,
      this.onTapDown,
      this.isRequired});

  final bool? enable;
  final bool? isRequired;
  final Function? onTapDown;
  final TextStyle? labelTextStyle;
  final bool? enableInteractiveSelection;
  final double? topPadding;
  final double? spacerHeight;
  final int? maxLength;
  final int? maxLines;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? helperText;
  final Color? hintColor;
  final TextEditingController? controller;
  final double? borderWidth;
  final double? height;
  final String? Function(String?) validator;
  final Function(String?) onSaved;
  final Function? onTap;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function? onFieldSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? label;
  final String? initialValue;
  final Function? onChanged;
  final bool? readOnly;
  final bool? autofocus;
  final AutovalidateMode? autovalidate;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    Widget textFormField = TextFormField(
      // enableInteractiveSelection: enableInteractiveSelection,
      // readOnly: readOnly,
      enabled: enable,
      autovalidateMode: autovalidate,
      //autovalidate: autovalidate,
      //onChanged: onChanged,
      //// maxLength: maxLength,
      initialValue: initialValue,
      //obscureText: obscureText,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
      controller: controller != null ? controller : null,
      focusNode: focusNode,
      textInputAction: textInputAction,
      //onFieldSubmitted: onFieldSubmitted,
      //autofocus: autofocus,
      //maxLines: maxLines,
      inputFormatters: inputFormatters,
      //style: kInputTextStyle(context),
      validator: validator,
      onSaved: onSaved,
      //onTap: onTap,
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Color(0xFFF1F6FF),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, style: BorderStyle.solid),
          //borderRadius: BorderRadius.circular(12),
        ),
        labelStyle: TextStyle(
          fontSize: 16,
          color: Color(0xFF4F4F4F),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
          ),
          //borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        helperMaxLines: 2,
        errorMaxLines: 2,
        errorText: errorText,
        hintStyle:
            TextStyle(fontWeight: FontWeight.w300, color: Color(0xFFB5C0D7)),
        helperText: helperText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );

    return label == null
        ? textFormField
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: topPadding ?? 0,
                ),
                Row(
                  children: [
                    Text(
                      label!,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.black),
                      // style: labelTextStyle ?? kLabelTextStyle
                    ),
                    Text(
                      isRequired == null || isRequired == false ? '' : '*',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.red),
                      // style: labelTextStyle ?? kLabelTextStyle
                    ),
                  ],
                ),
                SizedBox(
                  height: spacerHeight ?? 10.0,
                ),
                textFormField
              ],
            ),
          );
  }

  widget() {
    return TextFormField(
      style: TextStyle(color: Color(0xFF224188), fontWeight: FontWeight.w600),
      cursorColor: Color(0xFFE3A400),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1F6FF),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(12),
        ),
        labelStyle: TextStyle(
          fontSize: 16,
          color: Color(0xFF4F4F4F),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
