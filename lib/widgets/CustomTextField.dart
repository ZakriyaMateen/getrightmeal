import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/constants/fontWeights.dart';
import 'package:intl/intl.dart'; // For formatting dates

import '../Controllers/RegisterAndLoginControllers/RegisterPage1Controller.dart';
import '../constants/Sizes.dart';

class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? iconPath;
  final String? suffixIconPath;
  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.validator,
    this.controller,
    this.iconPath,
    this.suffixIconPath,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  RegisterPage1Controller registerPage1Controller = Get.find();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date as default
      firstDate: DateTime(1900), // Start date for selection
      lastDate: DateTime(2100), // End date for selection
    );
    if (pickedDate != null) {
      // Format the selected date and update the controller
      setState(() {
        widget.controller?.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // If the field is for password input
        widget.isPassword
            ? Obx(
              () => TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            obscureText: registerPage1Controller.isObsecure.value,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: dustyRose,
                fontWeight: w400,
                fontSize: size12,
              ),
              prefixIcon:


              widget.iconPath != null
                  ? Padding(
                padding: EdgeInsets.all(14.0),
                child: Image.asset(
                  '${widget.iconPath}',
                  width: 12,
                  height: 12,
                  fit: BoxFit.contain,
                  color: dustyRose,
                ),
              ):null
             ,
              hintText: widget.labelText,
              suffixIcon: widget.isPassword
                  ? InkWell(
                onTap: registerPage1Controller.togglePassword,
                child: Icon(
                  registerPage1Controller.isObsecure.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 14,
                  color: dustyRose,
                ),
              )
                  : widget.suffixIconPath != null
                  ? Padding(
                padding: EdgeInsets.all(14.0),
                child: Image.asset(
                  '${widget.suffixIconPath}',
                  width: 12,
                  height: 12,
                  fit: BoxFit.contain,
                ),
              )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), // Border radius
                borderSide: BorderSide.none, // No border side
              ),
              filled: true,
              fillColor: textFieldColor, // Grey background color
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 15,
              ), // Padding inside the TextFormField
            ),
            style: TextStyle(
              color: plumGrey,
              fontWeight: w400,
              fontSize: size12,
            ), // Text color
            maxLines: 1,
            minLines: 1,
          ),
        )
            : // Check if the field is for Date of Birth
        widget.labelText == "Date of Birth"
            ? TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          readOnly: true, // Make it read-only
          onTap: () {
            // Show date picker on tap
            _selectDate(context);
          },
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: dustyRose,
              fontWeight: w400,
              fontSize: size12,
            ),
            prefixIcon: widget.iconPath != null
                ? Padding(
              padding: EdgeInsets.all(14.0),
              child: Image.asset(
                '${widget.iconPath}',
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            )
                : null,
            hintText: widget.labelText,
            suffixIcon: widget.suffixIconPath != null
                ? Padding(
              padding: EdgeInsets.all(14.0),
              child: Image.asset(
                '${widget.suffixIconPath}',
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), // Border radius
              borderSide: BorderSide.none, // No border side
            ),
            filled: true,
            fillColor: textFieldColor, // Grey background color
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 15,
            ), // Padding inside the TextFormField
          ),
          style: TextStyle(
            color: plumGrey,
            fontWeight: w400,
            fontSize: size12,
          ), // Text color
          maxLines: 1,
          minLines: 1,
        )
            : // For non-password, non-DOB fields
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: dustyRose,
              fontWeight: w400,
              fontSize: size12,
            ),
            prefixIcon: widget.iconPath != null
                ? Padding(
              padding: EdgeInsets.all(14.0),
              child: Image.asset(
                '${widget.iconPath}',
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            )
                : null,
            hintText: widget.labelText,
            suffixIcon: widget.suffixIconPath != null
                ? Padding(
              padding: EdgeInsets.all(14.0),
              child: Image.asset(
                '${widget.suffixIconPath}',
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), // Border radius
              borderSide: BorderSide.none, // No border side
            ),
            filled: true,
            fillColor: textFieldColor, // Grey background color
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 15,
            ), // Padding inside the TextFormField
          ),
          style: TextStyle(
            color: plumGrey,
            fontWeight: w400,
            fontSize: size12,
          ), // Text color
          maxLines: 1,
          minLines: 1,
        ),
      ],
    );
  }
}
