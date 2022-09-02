import 'package:flutter/material.dart';
import 'package:muslim/presentation/screens/aflam_screen.dart';
import 'package:muslim/presentation/screens/series_page.dart';
import 'package:muslim/presentation/screens/youtube_view.dart';
import 'package:muslim/utils/colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


class UiTest extends StatefulWidget {
  const UiTest({Key? key}) : super(key: key);

  @override
  State<UiTest> createState() => _UiTestState();
}

class _UiTestState extends State<UiTest> {


  @override
  Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          elevation: 0.0,
          title: const Text('قصص الانبياء والرُّسل'),
          centerTitle: true,
        ),
        drawer: drawer(),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * .3,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://i0.wp.com/wiki.almenhaj.net/wp-content/uploads/678572801991606.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                 SizedBox(
                  height: height *.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeriesPage(
                              title: 'مسلسلات دينية',
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: height * .22,
                            width: width * .42,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://i.ytimg.com/vi/AQpi8biHZhs/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDpl8s39JzZOPprWFBrZfBCzZ2Y1Q',
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            width: width * .42,
                            bottom: 10,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.play_circle_outline_sharp,
                                  size: 80,
                                  color: Colors.grey[300],
                                ),
                                Text(
                                  'مسلسلات دينية',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(
                      width: width * .05,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AflamScreen(
                              title: 'افلام دينية',
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                             height: height * .22,
                            width: width * .42,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/img.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            width: width * .42,
                            bottom: 10,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.play_circle_outline_sharp,
                                  size: 80,
                                  color: Colors.grey[300],
                                ),
                                Text(
                                  'افلام دينية',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                 SizedBox(
                  height: height * .03,
                ),
                seriesCard(
                    title: 'شارك على الواتساب',
                    icon: Icons.whatsapp,
                    onPressed: () async {
                      String url =
                          "https://drive.google.com/drive/folders/1BPes6SXVN-kTNpbiWYAy_V_KRGrODlhq";
                      await Share.share('اتمنى التطبيق يعجبك! \n $url');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget seriesCard(
      {required String title,
      required IconData icon,
      required dynamic onPressed
      }) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height * .25,
        width: width * .42,
        margin:  EdgeInsets.only(bottom: 5),
        padding:  EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.green[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
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

  Drawer drawer() {
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
              image: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSytwmb47wPdHy2fBciXVzMd2HHQ05IohClR03Qi97C2Y7PuCaPD2hA7seaW48ch9k80Fg&usqp=CAU'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: height / 2.5,
            child: Padding(
              padding:
                   EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  drawerCard(
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
                  drawerCard(
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
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Text(
                  'Contact Me :',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                contactMe(
                  icon: Icons.whatsapp,
                  url: "https://api.whatsapp.com/send?phone=+2001156788394",
                ),
                contactMe(
                  icon: Icons.facebook,
                  url:
                      "https://web.facebook.com/profile.php?id=100067833803661",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          // Positioned(
          //           bottom: 0,
          //           child: Text('share'),
          //         ),
        ],
      ),
    );
  }

  IconButton contactMe(
      {required String url, required IconData icon, Color? color}) {
    return IconButton(
      onPressed: () async {
        await canLaunch(url) ? await launch(url) : throw 'could not lunch';
      },
      icon: Icon(
        icon,
        color: color == null ? Colors.green : color,
      ),
    );
  }

  Padding drawerCard(
      {required dynamic onPressed,
      required String title,
      required IconData icon}) {
        var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.only(top: height * .05),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.centerLeft,
          padding:  EdgeInsets.only(left: width * .02),
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

class CardWithImageAndText extends StatelessWidget {
  late String title;
  late String url;
  late String videoUrl;
  CardWithImageAndText(
      {Key? key,
      required this.title,
      required this.url,
      required this.videoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    YoutubeView(title: title, url: videoUrl)));
      },
      child: Stack(
        children: [
          Container(
            height: height * .25,
            width: width * .42,
            margin:  EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  this.title,
                  textDirection: TextDirection.rtl,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width * .42,
            height: height * .14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(this.url), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
