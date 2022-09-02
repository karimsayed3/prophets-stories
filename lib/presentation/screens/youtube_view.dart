
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeView extends StatefulWidget {
   String url;
  YoutubeView({Key? key, required this.title,required this.url}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<YoutubeView> createState() => _YoutubeViewState();
}

class _YoutubeViewState extends State<YoutubeView> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    String url = widget.url;
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(controller: controller),
          builder: (context, player) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green[700],
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                widget.title
              ),
            ),
            body: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height /4,
                ),
                player,
      
                
              ],
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ),
      ),
    );
  }
}