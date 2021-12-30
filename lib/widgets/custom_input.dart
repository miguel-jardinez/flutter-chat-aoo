import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  const CustomInput({Key? key,
    required this.icon,
    required this.hint,
    required this.textController,
    required this.keyboardType,
    required this.isPassword
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;


  @override
  Widget build(BuildContext context) {
  final double padding = !isPassword ? 40 : 10;

    return
      Container(
          margin: const EdgeInsets.only(bottom: 24),
          padding: EdgeInsets.only(right: padding),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: <BoxShadow> [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 5),
                  blurRadius: 5,
                )
              ]
          ),
          child: TextField(
            controller: textController,
            autocorrect: false,
            obscureText: isPassword,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                prefixIcon: Icon(icon),
                suffixIcon: isPassword ?  const Icon(Icons.visibility) : null,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: hint
            ),
          )
      );
  }
}
