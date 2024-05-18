import 'package:flutter/material.dart';

import '../../../constants.dart';

class Menu extends StatefulWidget {

  Function(int) _animate;
  Menu(this._animate);
  @override
  _MenuState createState() => _MenuState(_animate);
}

class _MenuState extends State<Menu> {
  Function(int) _animate;
  _MenuState(this._animate);
  int hoverIndex = -1;
  List<String> menuItems = [
    "Home",
    "About",
    "Services",
    "Portfolio",
    "Contact"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),
      constraints: BoxConstraints(maxWidth: 1110),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          menuItems.length,
          (index) =>  Expanded(child: buildMenuItem(index))
        ),
      ),
    );
  }

  Widget buildMenuItem(int index) => InkWell(
        onTap: () {
          setState(() {
            _animate(index);
          });
        },
        onHover: (value) {
          setState(() {
            hoverIndex = index;
          });
        },
        child: Container(
          height: 100,
          color: hoverIndex == index ? Colors.transparent : Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                menuItems[index],
                style: TextStyle(fontSize: hoverIndex == index ? 32 : 20, fontWeight: hoverIndex == index ? FontWeight.bold : FontWeight.normal, color:  hoverIndex == index ? Colors.white : kTextColor),
              ),
              // Hover
            ],
          ),
        ),
      );
}
