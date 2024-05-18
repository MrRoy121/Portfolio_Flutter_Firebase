import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key,
    required this.imageSrc,
    required this.text,
    required this.press,
  });

  final String imageSrc, text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
        horizontal: kDefaultPadding * 2.5,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFFE8F0F9),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(imageSrc, height: 40),
            SizedBox(width: kDefaultPadding),
            Text(text),
          ],
        ),
      ),
    );
  }
}
