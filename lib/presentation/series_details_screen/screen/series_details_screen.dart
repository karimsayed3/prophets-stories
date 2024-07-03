import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/presentation/series_page_screen/screen/series_page.dart';
import '../../../business_layer/generic_cubit/generic_cubit.dart';
import '../../../components/card_with_image_and_text.dart';
import '../../../data_layer/models/category_model.dart';
import '../../../data_layer/models/series_data_model.dart';
import '../../series_page_screen/data/repository/series_repository.dart';

class SeriesDetailsScreen extends StatefulWidget {
    final String id;
  final String title;

  const SeriesDetailsScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  List<SeriesData> seriesList = [];
  SeriesRepository seriesRepository = SeriesRepository();

  @override
  void initState() {
    // TODO: implement initState
    // BlocProvider.of<BlocTestCubit>(context).getAllSeries();
    seriesRepository.getSeriesCategoryById(widget.id);
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
          body: BlocBuilder<GenericCubit<Category<SeriesData>>, GenericCubitState<Category<SeriesData>>>(
            bloc: seriesRepository.getSeriesCategoryByIdCubit,
            builder: (
              (context, state) {
                if (state is GenericUpdatedState<Category<SeriesData>>) {
                  seriesList = state.data.items;
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        right: width * .03,
                        top: height * .02,
                        left: width * .03),
                    child: GridView.builder(
                        gridDelegate:
                             SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .8,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                        ),
                        itemCount: seriesList.length,
                        itemBuilder: (context, index) {
                          return CardWithImageAndText(
                            title: seriesList[index].title,
                            url: seriesList[index].imgUrl,
                            videoUrl: seriesList[index].link,
                          );
                        }),
                  );
                }
                else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
            ),
          ),
        ),
      ),
    );
  }
}
