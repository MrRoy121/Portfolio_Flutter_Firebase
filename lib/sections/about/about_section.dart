import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/default_button.dart';
import '../../components/my_outline_button.dart';
import '../../constants.dart';
import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('About')
                    .doc("exp")
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const AboutSectionText(text: 'Loading...');
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AboutTextWithSign(),
                      Expanded(
                        child: AboutSectionText(text: snapshot.data!['section1']),
                      ),
                      ExperienceCard(numOfExp: snapshot.data!['exp']),
                      Expanded(
                        child: AboutSectionText(
                          text: snapshot.data!['section2'],
                        ),
                      ),
                    ],
                  );
                }),
          const SizedBox(height: kDefaultPadding * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyOutlineButton(
                imageSrc: "assets/images/hand.png",
                text: "Hire Me!",
                press: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
