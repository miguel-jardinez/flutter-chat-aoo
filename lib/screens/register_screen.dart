import 'package:flutter/material.dart';

import 'package:real_time_chat/widgets/login/labels_form.dart';
import 'package:real_time_chat/widgets/login/logo.dart';
import 'package:real_time_chat/widgets/register/form_register.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Logo(
                    headetText: 'Register',
                  ),
                  FormRegister(),
                  LabelsForm(
                    buttonText: 'Sign up',
                    firstLabel: 'have you already an account?',
                    route: 'login',
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
