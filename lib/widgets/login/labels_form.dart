import 'package:flutter/material.dart';

class LabelsForm extends StatelessWidget {
  const LabelsForm({
    Key? key,
    required this.firstLabel,
    required this.buttonText,
    required this.route,
  }) : super(key: key);

  final String firstLabel;
  final String buttonText;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        children:  [
          Text(
            firstLabel,
            style: const TextStyle(
                color: Colors.black26,
                fontSize: 15,
                fontWeight: FontWeight.w400
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, route);
              },
              child: Text(buttonText)
          ),
          const Text(
            'Terminos y condiciones',
            style: TextStyle(fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
