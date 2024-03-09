import 'package:flutter/material.dart';
import 'package:to_do_list_hive/app_config/theme.dart';
import 'package:to_do_list_hive/app_config/ui_helper.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    required this.title,
    this.obscureText,
    this.keyboardType = TextInputType.text,
  });
  final TextEditingController controller;
  final String? hintText;
  final String? title;
  final TextInputType keyboardType;
  final bool? obscureText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title!,
              style: AppTheme().customTextNormal(
                AppColours.lightBlack,
                18,
              ),
            ),
            vsBox1,
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color:AppColours.textBoxColor ,
                  borderRadius: BorderRadius.circular(
                    cornerRadiusLarge,
                  ),
                  border: Border.all(
                    color: AppColours.grey1,
                  ),
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  obscureText: widget.obscureText ?? false,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  cursorColor: AppColours.black,
                  decoration: InputDecoration(
                    counterText: '',
                    filled: true,
                    fillColor: AppColours.textBoxColor,
                    border: InputBorder.none,
                    hintText: widget.hintText ?? '',
                    hintStyle: AppTheme().customTextNormal(
                      AppColours.hintTextColor,
                      12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
