import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Service.dart';

class ServiceCard extends StatefulWidget {
  ServiceCard({super.key,
    required this.index,
    required this.image,
    required this.color,
    required this.title,
  });

  String image, title, color;
  final int index;

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class _ServiceCardState extends State<ServiceCard> {

  bool isHover = false;
  Duration duration = Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        duration: duration,
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
        height: 256,
        width: 256,
        decoration: BoxDecoration(
          color: widget.color.toColor(),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.all(kDefaultPadding * 1.5),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  if (!isHover)
                    BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.1),
                    ),
                ],
              ),
              child: Image.network(
                widget.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Text(
              widget.title,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
