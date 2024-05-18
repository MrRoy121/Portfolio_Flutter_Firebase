import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class PersonPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/person.png",
        height: MediaQuery.of(context).size.height+100,
        fit: BoxFit.fill,
      ),
    );
  }
}
