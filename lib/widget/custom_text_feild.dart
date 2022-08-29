import 'package:flutter/material.dart';
import 'package:perfume_store/widget/constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontFamily: 'Poppins'),
          prefixIcon: Icon(prefixIcon , color: mainColor,),
          enabledBorder: border(),
          focusedBorder: border(borderColor: mainColor)
      ),
    );
  }

  OutlineInputBorder border({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
