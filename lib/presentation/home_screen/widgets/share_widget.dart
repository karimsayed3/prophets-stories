import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  final String title;
  final String icon;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height * .25,
        width: width * .42,
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.green[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
            ),
            SizedBox(
              height: height * .04,
            ),
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
