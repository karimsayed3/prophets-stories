import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWithTitleWidget extends StatelessWidget {
  const IconWithTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Positioned(
      width: width * .42,
      bottom: 10.h,
      child: Column(
        children: [
          Icon(
            Icons.play_circle_outline_sharp,
            size: 80.w,
            color: Colors.grey[300],
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 20.sp, color: Colors.grey[300]),
          ),
        ],
      ),
    );
  }
}
