import 'package:flutter/material.dart';

import '../../aflam_screen/screen/aflam_screen.dart';
import '../../series_page_screen/screen/series_page.dart';
import 'contact_me_widget.dart';
import 'drawer_card.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      width: width * .8,
      elevation: 0.0,
      backgroundColor: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * .25,
            width: double.infinity,
            color: Colors.green,
            child: const Image(
              image: const NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSytwmb47wPdHy2fBciXVzMd2HHQ05IohClR03Qi97C2Y7PuCaPD2hA7seaW48ch9k80Fg&usqp=CAU'),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height / 2.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerCard(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeriesPage(
                              title: 'مسلسلات دينية',
                            ),
                          ),
                        );
                      },
                      title: 'مسلسلات دينية',
                      icon: Icons.yard_outlined),
                  DrawerCard(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AflamScreen(
                              title: 'افلام دينية',
                            ),
                          ),
                        );
                      },
                      title: 'افلام دينية',
                      icon: Icons.yard_outlined),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  'Contact Me :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ContactMeWidget(
                  imagePath: "assets/images/whatsapp.svg",
                  url: "https://api.whatsapp.com/send?phone=+2001156788394",
                ),
                ContactMeWidget(
                  icon: Icons.facebook,
                  url:
                      "https://web.facebook.com/profile.php?id=100067833803661",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
