import 'package:flutter/material.dart';

class DrawerCard extends StatelessWidget {
  const DrawerCard({super.key,required this. onPressed,
    required this. title,
    required this. icon});


  final dynamic onPressed;
  final String title;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: height * .05),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: width * .02),
          height: 50,
          decoration: BoxDecoration(
              color: Colors.indigo[100],
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: width * .05,
              ),
              Text(
                title,
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
