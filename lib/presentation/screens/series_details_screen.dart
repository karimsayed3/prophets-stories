import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/presentation/screens/home_screen.dart';
import 'package:muslim/presentation/screens/series_page.dart';

import '../../business_test/cubit/bloc_test_cubit.dart';
import '../../data_test/series_data.dart';


class SeriesDetailsScreen extends StatefulWidget {
  final String id;
  final String title;
  const SeriesDetailsScreen({Key? key, required this.id,required this.title}) : super(key: key);

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  List<SeriesData> seriesList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     BlocProvider.of<BlocTestCubit>(context).emitGetSeriesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SeriesPage(
                                title: 'مسلسلات دينية',
                              )),
                      (route) => false);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              elevation: 0.0,
              backgroundColor: Colors.green[700],
              title: Text(widget.title),
              // title: Text(),
            ),
            body: BlocBuilder<BlocTestCubit, BlocTestState>(
                builder: ((context, state) {
              if (state is getSeriesByIdState) {
                seriesList = state.user;
                return Container(
                  width: double.infinity,
                  padding:  EdgeInsets.only(right: width *.03, top: height * .02,left: width *.03),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10,
                              ),
                      itemCount: seriesList.length,
                      itemBuilder: (context, index) {
                        return CardWithImageAndText(
                          title: seriesList[index].title!,
                          url: seriesList[index].imgUrl!,
                          videoUrl: seriesList[index].link!,
                        );
                      }),
                );
                // return Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: const CircularProgressIndicator());
              }
            }))),
      ),
    );
  }
}
