import 'package:flutter/material.dart';
import 'package:ecoquest/styles/app_text.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color textColor;

  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder()),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              buttonText,
              style: AppText.buttonTextStyle.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
