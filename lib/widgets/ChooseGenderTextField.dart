import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/constants/fontWeights.dart';

import '../constants/Sizes.dart';

class ChooseGenderTextField extends StatefulWidget {
  final String? labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? iconPath;

  const ChooseGenderTextField({
    Key? key,
    this.labelText,
    this.validator,
    this.controller,
    this.iconPath,
  }) : super(key: key);

  @override
  State<ChooseGenderTextField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<ChooseGenderTextField> {
  // Gender options
  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  bool isDropDownVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          readOnly: true, // Make the TextFormField read-only to prevent manual input
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
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isDropDownVisible = !isDropDownVisible; // Toggle drop-down visibility
                });
              },
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: dustyRose,
                size: 18,
              ),
            ),
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
        // Drop-down menu for selecting gender
        if (isDropDownVisible)
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: genderOptions.map((gender) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      widget.controller?.text = gender.toLowerCase(); // Update controller text
                      isDropDownVisible = false; // Close the drop-down after selection
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      gender,
                      style: TextStyle(
                        color: plumGrey,
                        fontSize: size12,
                        fontWeight: w400,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
