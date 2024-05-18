import 'package:flutter/material.dart';

import '../../../constants.dart';

class AboutSectionText extends StatelessWidget {
  const AboutSectionText({super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w200, color: kTextColor, height: 2),
      ),
    );
  }
}
