import 'package:flutter/material.dart';


import '../../../constants.dart';
import '../../../models/RecentWork.dart';

class RecentWorkCard extends StatefulWidget {

  final String title, image, category;
  const RecentWorkCard({super.key,
    required this.index,
    required this.press,
    required this.title,
    required this.image,
    required this.category,
  });

  final int index;
  final Function() press;

  @override
  _RecentWorkCardState createState() => _RecentWorkCardState();
}

class _RecentWorkCardState extends State<RecentWorkCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 160,
        width: 540,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Row(
          children: [
            Image.network(widget.image),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.category.toUpperCase()),
                    SizedBox(height: kDefaultPadding / 2),
                    Text(
                      widget.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(height: 1.5),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Text(
                      "View Details",
                      style: TextStyle(decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
