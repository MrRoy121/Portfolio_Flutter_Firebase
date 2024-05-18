import 'package:flutter/material.dart';
import 'package:portfolio/sections/about/about_section.dart';
import 'package:portfolio/sections/contact/contact_section.dart';
import 'package:portfolio/sections/feedback/feedback_section.dart';
import 'package:portfolio/sections/recent_work/recent_work_section.dart';
import 'package:portfolio/sections/service/service_section.dart';
import 'package:portfolio/sections/topSection/top_section.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  late double _height;
  void _animate(int i) {
    if (i == 0) {
      _scrollController.animateTo(-_height * 3.5,
          duration: const Duration(milliseconds: 700), curve: Curves.ease);
    } else if (i == 1) {
      _scrollController.animateTo(_height + 40,
          duration: const Duration(milliseconds: 700), curve: Curves.ease);
    } else if (i == 2) {
      _scrollController.animateTo(_height * 2,
          duration: const Duration(milliseconds: 700), curve: Curves.ease);
    } else if (i == 3) {
      _scrollController.animateTo(_height * 3 + 250,
          duration: const Duration(milliseconds: 700), curve: Curves.ease);
    } else if (i == 4) {
      _scrollController.animateTo(_height * 6,
          duration: const Duration(milliseconds: 700), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: _height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              TopSection(_animate),
              const SizedBox(height: kDefaultPadding * 2),
              AboutSection(),
              ServiceSection(),
              RecentWorkSection(),
              FeedbackSection(),
              const SizedBox(height: kDefaultPadding),
              ContactSection(),
              // This SizeBox just for demo
              // SizedBox(
              //   height: 500,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
