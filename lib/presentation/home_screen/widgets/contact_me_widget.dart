import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactMeWidget extends StatelessWidget {
  const ContactMeWidget(
      {super.key, required this.url, this.icon, this.imagePath, this.color});

  final String url;
  final dynamic icon;
  final dynamic imagePath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await canLaunch(url) ? await launch(url) : throw 'could not lunch';
      },
      icon: icon==null? SvgPicture.asset(imagePath,width: 25.w,) : Icon(
        icon,
        color: color ?? Colors.green,
      ),
    );
  }
}
