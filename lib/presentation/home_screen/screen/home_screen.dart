import 'package:flutter/material.dart';
import 'package:muslim/data_layer/firestore_services.dart';
import 'package:muslim/data_layer/models/category_model.dart';
import 'package:muslim/data_layer/models/series_data_model.dart';
import 'package:muslim/presentation/home_screen/widgets/contact_me_widget.dart';
import 'package:muslim/presentation/home_screen/widgets/drawer_widget.dart';
import 'package:muslim/presentation/home_screen/widgets/info_card.dart';
import 'package:muslim/presentation/aflam_screen/screen/aflam_screen.dart';
import 'package:muslim/presentation/home_screen/widgets/share_widget.dart';
import 'package:muslim/presentation/series_page_screen/screen/series_page.dart';
import 'package:muslim/presentation/screens/youtube_view.dart';
import 'package:muslim/utils/colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data_layer/models/film_data_model.dart';
import '../widgets/drawer_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FireStoreService fireStoreService = FireStoreService();

  @override
  void initState() {
    // TODO: implement initState
    // fireStoreService.addSeriesCategory(
    //   Category<SeriesData>(id: "", title: "قصص الانبياء", backGImg: "https://i.ytimg.com/vi/AQpi8biHZhs/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDpl8s39JzZOPprWFBrZfBCzZ2Y1Q", items: [
    //     SeriesData(
    //       title: "قصص الانبياء",
    //       imgUrl: "https://i.ytimg.com/vi/AQpi8biHZhs/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDpl8s39JzZOPprWFBrZfBCzZ2Y1Q",
    //       link: "https://youtu.be/Y9HP-pWA1_M",
    //     )
    //   ])
    // );
    super.initState();
  }

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
        drawer: const DrawerWidget(),
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
                  height: height * .03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoCard(
                        title: 'مسلسلات دينية',
                        networkImage:
                            'https://i.ytimg.com/vi/AQpi8biHZhs/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDpl8s39JzZOPprWFBrZfBCzZ2Y1Q',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeriesPage(
                                title: 'مسلسلات دينية',
                              ),
                            ),
                          );
                        }),
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
                                      fontSize: 20, color: Colors.grey[300]),
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
                ShareWidget(
                  title: 'شارك على الواتساب',
                  icon: "assets/images/whatsapp.svg",
                  onPressed: () async {
                    String url =
                        "https://drive.google.com/drive/folders/1BPes6SXVN-kTNpbiWYAy_V_KRGrODlhq";
                    await Share.share('اتمنى التطبيق يعجبك! \n $url');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
