import 'package:flutter/material.dart';

import '../../series_page_screen/screen/series_page.dart';
import 'icon_with_title_widget.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.title, required this.networkImage,required this.onTap});

  final String title;
  final String networkImage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: height * .22,
            width: width * .42,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
                image:  DecorationImage(
                  image: NetworkImage(networkImage),
                  fit: BoxFit.cover,
                )),
          ),
          IconWithTitleWidget(title: title),
        ],
      ),
    );
  }
}
