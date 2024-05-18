import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/hireme_card.dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import '../../models/RecentWork.dart';
import 'components/recent_work_card.dart';

class RecentWorkSection extends StatefulWidget {
  @override
  State<RecentWorkSection> createState() => _RecentWorkSectionState();
}

class _RecentWorkSectionState extends State<RecentWorkSection> {
  void initState() {
    getSliderImageFromDb();
    super.initState();
  }

  Future getSliderImageFromDb() async {
    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await fireStore.collection('Recent Works').get();
    return snapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding * 6),
      width: double.infinity,
      // just for demo
      // height: 600,
      decoration: BoxDecoration(
        color: Color(0xFFF7E8FF).withOpacity(0.3),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/recent_work_bg.png"),
        ),
      ),
      child: Column(
        children: [
          Transform.translate(
            offset: Offset(0, -80),
            child: HireMeCard(),
          ),
          SectionTitle(
            title: "Recent Works",
            subTitle: "My Strong Arenas",
            color: Color(0xFFFFB100),
          ),
          SizedBox(height: kDefaultPadding * 1.5),
          SizedBox(
            width: 1110,
            child: FutureBuilder(
              future: getSliderImageFromDb(),
              builder: (_, snapShot) {
                return snapShot.data == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Wrap(
                    spacing: kDefaultPadding,
                    runSpacing: kDefaultPadding * 2,
                    children: List.generate(
                        snapShot.data!.length,(index) => RecentWorkCard(
                        index: index,
                        press: () {},
                        category: snapShot.data![index]['category'],
                        title: snapShot.data![index]['title'],
                        image: snapShot.data![index]['image'])));
              },
            ),
          ),
          SizedBox(height: kDefaultPadding * 5),
        ],
      ),
    );
  }
}
