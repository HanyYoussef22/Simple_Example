import 'package:flutter/material.dart';

Widget customField({
  VoidCallback? fieldTapping,
  required String name,
  IconData? prefixIcon,
  Color? fillColor,
  required String? Function(String?) validate,
  IconButton? suffixIcon,
  required TextEditingController controller,
  bool? obsecureText,
  bool? autofocus,
}) {
  return TextFormField(
    autofocus: autofocus ?? false,
    controller: controller,
    validator: validate,
    onTap: fieldTapping,
    obscureText: obsecureText ?? false,
    decoration: InputDecoration(
      hintText: name,
      suffixIcon: suffixIcon,
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontFamily: 'Poppins',
        // fontWeight: FontWeight.w600,
      ),
      // prefixIcon: Icon(prefixIcon),
      filled: true,
      fillColor: fillColor,
      enabledBorder:  buildOutlineInputBorder(),
      focusedBorder:  buildOutlineInputBorder(),
    ),
  );
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}

Widget submitButton({
  required String submitText,
  required onTap,
}) {
  return SizedBox(
    height: 55,
    width: double.infinity,
    child: ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        backgroundColor:  Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
      onPressed: onTap,
      child: Text(
        submitText,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: 'Poppins'),
      ),
    ),
  );
}

