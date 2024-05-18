import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/section_title.dart';
import '../../constants.dart';
import '../../models/Service.dart';
import 'components/service_card.dart';

class ServiceSection extends StatefulWidget {
  @override
  State<ServiceSection> createState() => _ServiceSectionState();
}

class _ServiceSectionState extends State<ServiceSection> {
  int _index = 0;
  int _dataLength = 1;
  @override
  void initState() {
    getSliderImageFromDb();
    super.initState();
  }

  Future getSliderImageFromDb() async {
    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await fireStore.collection('Section').get();
    if (mounted) {
      setState(() {
        _dataLength = snapshot.docs.length;
      });
    }
    return snapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: const BoxConstraints(maxWidth: 1110, maxHeight: 600),
      child: Column(
        children: [
          const SectionTitle(
            color: Colors.blueAccent,
            title: "Service Offerings",
            subTitle: "My Strong Arenas Of",
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                if (_dataLength != 0)
                  FutureBuilder(
                    future: getSliderImageFromDb(),
                    builder: (_, snapShot) {
                      return snapShot.data == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: CarouselSlider.builder(
                                itemCount: snapShot.data!.length,
                                itemBuilder:
                                    (BuildContext context, index, int) {
                                  return ServiceCard(
                                      index: _index,
                                      color: snapShot.data![index]['color'],
                                      title: snapShot.data![index]['title'],
                                      image: snapShot.data![index]['image']);
                                },
                                options: CarouselOptions(
                                    viewportFraction: 0.3,
                                    enlargeCenterPage: false,
                                    initialPage: 0,
                                    autoPlay: true,
                                    height:
                                        MediaQuery.of(context).size.height / 2 -
                                            10,
                                    onPageChanged:
                                        (int i, carouselPageChangedReason) {
                                      setState(() {
                                        _index = i;
                                      });
                                    }),
                              ),
                            );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
