// ignore_for_file: non_constant_identifier_names



import 'package:muslim/data_test/series_data.dart';
import 'package:muslim/data_test/series_model.dart';
import 'package:muslim/data_test/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  // Future<Series> getAllNoahSeries()async {
  //   var response = await webServices.getAllNoahSeries();
  //   return response ;
  // }
  // Future<Series> getAllYoussefSeries1()async {
  //   var response = await webServices.getAllYoussefSeries1();
  //   return response ;
  // }
  // Future<Series> getAllYoussefSeries2()async {
  //   var response = await webServices.getAllYoussefSeries2();
  //   return response ;
  // }
  // Future<Series> getAllkalem_allahSeries1()async {
  //   var response = await webServices.getAllkalem_allahSeries1();
  //   return response ;
  // }
  // Future<Series> getAllkalem_allahSeries2()async {
  //   var response = await webServices.getAllkalem_allahSeries2();
  //   return response ;
  // }
  // Future<Series> getAllAlrasol_MohamedSeries1()async {
  //   var response = await webServices.getAllAlrasol_MohamedSeries1();
  //   return response ;
  // }
  // Future<Series> getAllAlrasol_MohamedSeries2()async {
  //   var response = await webServices.getAllAlrasol_MohamedSeries2();
  //   return response ;
  // }
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

  // Future<Product> addNewUser(Product newProduct) async{
  //   return await webServices.addNewUser(newProduct);  
  // }

  // Future<Product> deleteProductByID(String id) async{
  //   return await webServices.deleteProductByID(id);  
  // }

  // Future<Product> updateProduct(String id,Map<String,dynamic> map) async{
  //   return await webServices.updateProduct(id,map);  
  // }

  
}