import 'package:flutter/material.dart';

import '../custom_input.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  FormRegisterState createState() => FormRegisterState();
}

class FormRegisterState extends State<FormRegister> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        CustomInput(
          icon: Icons.perm_identity,
          hint: 'username',
          isPassword: false,
          keyboardType: TextInputType.emailAddress,
          textController: nameController,
        ),
        CustomInput(
          icon: Icons.mail_outline,
          hint: 'Email',
          isPassword: false,
          keyboardType: TextInputType.text,
          textController: emailController,
        ),
        CustomInput(
            icon: Icons.lock_outlined,
            hint: 'Password',
            textController: passwordController,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true
        ),
        CustomInput(
            icon: Icons.lock_outlined,
            hint: 'Confirm Password',
            textController: confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                print('Email ${emailController.text}');
                print('Password ${passwordController.text}');
                Navigator.pushReplacementNamed(context, 'login');
              },
              child: Text('Register Account')
          ),
        )
      ],
    );
  }
}
