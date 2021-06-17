import '../../shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  final Color color;
  final Color iconColor;

  const SocialIcon({
    Key key,
    this.color,
    this.iconColor,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: defaultColor,
            width: 1.0
            )),
        child: SvgPicture.asset(
          iconSrc,
          height: 30,
          width: 30,
          color: iconColor,
        ),
      ),
    );
  }
}
