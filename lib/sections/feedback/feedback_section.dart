import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/section_title.dart';
import '../../constants.dart';
import '../../models/Feedback.dart';
import 'components/feedback_card.dart';

class FeedbackSection extends StatefulWidget {
  @override
  State<FeedbackSection> createState() => _FeedbackSectionState();
}

class _FeedbackSectionState extends State<FeedbackSection> {

  @override
  void initState() {
    getSliderImageFromDb();
    super.initState();
  }

  Future getSliderImageFromDb() async {
    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await fireStore.collection('FeedBack').get();
    return snapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            title: "Feedback Received",
            subTitle: "Client’s testimonials that inspired me a lot",
            color: Color(0xFF00B1FF),
          ),
          SizedBox(height: kDefaultPadding),
          FutureBuilder(
            future: getSliderImageFromDb(),
            builder: (_, snapShot) {
              return snapShot.data == null
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    snapShot.data!.length,
                      (index) => FeedbackCard(index: index,
                          color: snapShot.data![index]['color'],
                          name: snapShot.data![index]['name'],
                          image: snapShot.data![index]['image'], review: snapShot.data![index]['review'],)
                )
                );
            },
          ),
        ],
      ),
    );
  }
}
