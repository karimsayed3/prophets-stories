import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/presentation/screens/series_details_screen.dart';

import '../../business_test/cubit/bloc_test_cubit.dart';
import '../../data_test/series_model.dart';
import '../../utils/dimantions.dart';
import 'home_screen.dart';


class SeriesPage extends StatefulWidget {
  String title;
  SeriesPage({Key? key, required this.title})
      : super(key: key);

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  late Series seriesList;
  late List<Series> series;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BlocTestCubit>(context).getAllSeries();
    super.initState();
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
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>UiTest()), (route) => false);
                },
                icon: Icon(Icons.home),
              ),
            ],
            elevation: 0.0,
            backgroundColor: Colors.green[700],
            title: Text(widget.title),
          ),
          body: BlocBuilder<BlocTestCubit, BlocTestState>(
            builder: ((context, state) {
              if (state is GetAllSeriesState) {
                series = state.usersList;
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(right: width *.03, top: height * .02,left: width *0.03),
                  child: GridView.builder(
                      gridDelegate:
                          const  SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10,
                              ),
                      itemCount: series.length,
                      itemBuilder: (context, index) {
                        print(series[index].id);
                        return seriesCard(
                          title: series[index].title!,
                          url: series[index].backGImg!,
                          id : series[index].id!
                        );
                      }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget seriesCard(
      {required String title, required String url,required String id}) 
      {
        var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
              context, MaterialPageRoute(builder: (context) => SeriesDetailsScreen(id: id,title:title),),);
      },
      child: Stack(
        children: [
          Container(
            width: width * .42,
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
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
                  image: NetworkImage(url), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
