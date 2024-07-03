import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_layer/generic_cubit/generic_cubit.dart';
import '../../../data_layer/models/category_model.dart';
import '../../../data_layer/models/series_data_model.dart';
import '../../../data_layer/series_model.dart';
import '../../../utils/dimantions.dart';
import '../../home_screen/screen/home_screen.dart';
import '../data/repository/series_repository.dart';
import '../widgets/series_card.dart';

class SeriesPage extends StatefulWidget {
  String title;

  SeriesPage({Key? key, required this.title}) : super(key: key);

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  late Series seriesList;
  late List<Category<SeriesData>> series;

  SeriesRepository seriesRepository = SeriesRepository();

  @override
  void initState() {
    // TODO: implement initState
    // BlocProvider.of<BlocTestCubit>(context).getAllSeries();
    seriesRepository.getSeriesCategories();
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
              /// TODO : make it as a widget
              IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (route) => false);
                },
                icon: const Icon(Icons.home),
              ),
            ],
            elevation: 0.0,
            backgroundColor: Colors.green[700],
            title: Text(widget.title),
          ),
          body: BlocBuilder<GenericCubit<List<Category<SeriesData>>>, GenericCubitState<List<Category<SeriesData>>>>(
            bloc: seriesRepository.getSeriesCategoriesCubit,
            builder: ((context, state) {
              if (state is GenericUpdatedState<List<Category<SeriesData>>>) {
                series = state.data;
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      right: width * .03,
                      top: height * .02,
                      left: width * 0.03),
                  child: GridView.builder(
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .9,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                      ),
                      itemCount: series.length,
                      itemBuilder: (context, index) {
                        // print(series[index].id);
                        return SeriesCard(
                          title: series[index].title,
                          url: series[index].backGImg,
                          id: series[index].id,
                        );
                      }),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          ),
        ),
      ),
    );
  }
}
