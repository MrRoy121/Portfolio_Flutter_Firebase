import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class AboutTextWithSign extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('About')
                .doc("exp")
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Text('Loading...');
              }
              return Text(
                snapshot.data!['Title'].replaceAll("__T", "\n"),
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              );
            }),
        SizedBox(height: kDefaultPadding * 2),
        Image.asset("assets/images/sign.png")
      ],
    );
  }
}
