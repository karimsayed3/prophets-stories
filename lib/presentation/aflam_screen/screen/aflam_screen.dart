import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/business_layer/generic_cubit/generic_cubit.dart';
import 'package:muslim/presentation/home_screen/screen/home_screen.dart';
import '../../../components/card_with_image_and_text.dart';
import '../../../data_layer/models/category_model.dart';
import '../../../data_layer/models/film_data_model.dart';
import '../../../data_layer/series_data.dart';
import '../../../data_layer/series_model.dart';
import '../data/aflam_repository.dart';

class AflamScreen extends StatefulWidget {
  late String title;

  AflamScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<AflamScreen> createState() => _AflamScreenState();
}

class _AflamScreenState extends State<AflamScreen> {
  late List<FilmData> seriesList;

  AflamRepository aflamRepository = AflamRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aflamRepository.getAllAflam();
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
            elevation: 0.0,
            backgroundColor: Colors.green[700],
            title: Text(widget.title),
          ),
          body: BlocBuilder<GenericCubit<List<FilmData>>,
              GenericCubitState<List<FilmData>>>(
            bloc: aflamRepository.getAllAflamCubit,
            builder: ((context, state) {
              if (state is GenericUpdatedState<List<FilmData>>) {
                seriesList = state.data;
                // List series = seriesList;
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      right: width * .03,
                      top: height * .02,
                      left: width * 0.03),
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
                          title: seriesList[index].title,
                          url: seriesList[index].imgUrl,
                          videoUrl: seriesList[index].link,
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
