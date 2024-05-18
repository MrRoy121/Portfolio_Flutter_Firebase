import 'dart:ui';

import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/logo_blur_box.dart';
import 'components/menu.dart';
import 'components/person_pic.dart';

class TopSection extends StatelessWidget {
  Function(int) _animate;
  TopSection(this._animate);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints(maxHeight: 800, minHeight: 700),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background.jpg"),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding),
        width: MediaQuery.of(context).size.width-350,
        child: Stack(
          alignment: Alignment.center,
          children: [
            LogoAndBlurBox(size: size),
            Positioned(
              bottom: 0,
              left: MediaQuery.of(context).size.width/3,
              child: PersonPic(),
            ),
            Positioned(
              bottom: 0,
              child: Menu(_animate),
            ),
          ],
        ),
      ),
    );
  }
}
