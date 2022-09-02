import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/presentation/screens/home_screen.dart';

import '../../business_test/cubit/bloc_test_cubit.dart';
import '../../data_test/series_data.dart';
import '../../data_test/series_model.dart';


class AflamScreen extends StatefulWidget {
  late String title;
   AflamScreen({Key? key,required this.title}) : super(key: key);

  @override
  State<AflamScreen> createState() => _AflamScreenState();
}

class _AflamScreenState extends State<AflamScreen> {
  late Series seriesList ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<BlocTestCubit>(context).getAllAflam();
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
            body: BlocBuilder<BlocTestCubit, BlocTestState>(
                builder: ((context, state) {
              if (state is getAllAflamState) {
                seriesList = state.usersList;
                List series = seriesList.series!;
                return Container(
                  width: double.infinity,
                  padding:  EdgeInsets.only(right: width *.03, top: height * .02,left: width *0.03),
                  child: GridView.builder(
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10,
                              ),
                      itemCount: series.length,
                      itemBuilder: (context, index) {
                        return CardWithImageAndText(
                          title: series[index].title!,
                          url: series[index].imgUrl!,
                          videoUrl: series[index].link!,
                        );
                      }),
                );
              } else {
                return const Center(child: const CircularProgressIndicator());
              }
            }))),
      ),
    );
  }
}
