import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class GlassContent extends StatefulWidget {
  const GlassContent({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<GlassContent> createState() => _GlassContentState();
}

class _GlassContentState extends State<GlassContent> {


  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 2,
              vertical: widget.size.height / 4),
          margin:
              EdgeInsets.only(right: widget.size.width / 3.8),
          width: double.infinity,
          color: Colors.white.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "I'M ",
                    style: TextStyle(
                      fontSize: _width/35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: _width/35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('NILASHISH ROY',
                            speed: const Duration(milliseconds: 200)),
                        TypewriterAnimatedText('APPLICATION DEVELOPER',
                            speed: const Duration(milliseconds: 200)),
                        TypewriterAnimatedText('UI/UX DESIGNER',
                            speed: const Duration(milliseconds: 200)),
                        TypewriterAnimatedText('VIDEO EDITOR',
                            speed: const Duration(milliseconds: 200)),
                        TypewriterAnimatedText('GRAPHICS DESIGNER',
                            speed: const Duration(milliseconds: 200)),
                        TypewriterAnimatedText('FREELANCER',
                            speed: const Duration(milliseconds: 200)),
                      ],
                      isRepeatingAnimation: true,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  "Application Developer, UI/UX Designer, Video Editor, Graphics Designer, Freelancer",
                  style: TextStyle(
                    fontSize: _width/85.375,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () async {
                          const url = 'https://www.fiverr.com/users/mrroy111';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child:
                            Image.asset("assets/images/fiverr.png", width: 25)),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () async {const url = 'https://bd.linkedin.com/in/nilashish-roy-b8a4a0171?trk=people-guest_people_search-card';
                        if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                        } else {
                        throw 'Could not launch $url';
                        }},
                        child: Image.asset("assets/images/linkedin.png",
                            width: 25)),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () async {const url = 'https://t.me/IamMrRoy121';
                        if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                        } else {
                        throw 'Could not launch $url';
                        }},
                        child:
                            Image.asset("assets/images/whats.png", width: 25)),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () async {const url = 'https://github.com/MrRoy121';
                        if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                        } else {
                        throw 'Could not launch $url';
                        }},
                        child:
                            Image.asset("assets/images/github.png", width: 25)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
