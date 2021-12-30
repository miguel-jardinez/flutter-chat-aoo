import 'package:flutter/material.dart';

import 'custom_input.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  FormLoginState createState() => FormLoginState();
}

class FormLoginState extends State<FormLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        CustomInput(
          icon: Icons.mail_outline,
          hint: 'Email',
          isPassword: false,
          keyboardType: TextInputType.emailAddress,
          textController: emailController,
        ),
        CustomInput(
            icon: Icons.lock_outlined,
            hint: 'Password',
            textController: passwordController,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                print('Email ${emailController.text}');
                print('Password ${passwordController.text}');
                Navigator.pushReplacementNamed(context, 'users');
              },
              child: Text('Login account')
          ),
        )
      ],
    );
  }
}
