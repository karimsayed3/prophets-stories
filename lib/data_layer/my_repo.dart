import 'package:muslim/data_layer/series_data.dart';
import 'package:muslim/data_layer/series_model.dart';
import 'package:muslim/data_layer/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<Series> getAllAflam()async {
    var response = await webServices.getAllAflam();
    return response ;
  }

  Future<List<Series>> getAllSeries()async {
    var response = await webServices.getAllSeries();
    return response ;
  }

  Future<List<SeriesData>> getSeriesById(String UserId) async {
    var response = await webServices.getSeriesById(UserId);
    return response.map((singleSeries) => SeriesData.fromJson(singleSeries.toJson())).toList();
    // return  await webServices.getSeriesById(UserId);
  }
}