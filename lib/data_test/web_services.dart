import 'package:dio/dio.dart';
import 'package:muslim/data_test/series_data.dart';
import 'package:muslim/data_test/series_model.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: "https://series-api1.herokuapp.com/")
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;


  @GET("aflam")
  Future<Series> getAllAflam();
  @GET("all_series")
  Future<List<Series>> getAllSeries();
  
  @GET("all_series/{id}")
  Future<List<SeriesData>> getSeriesById(@Path() String id);

  // @POST("product")
  // Future<Product> addNewUser(@Body() Product newProduct);

  // @DELETE("product/{id}")
  // Future<Product> deleteProductByID(@Path() String id);

  // @PATCH("/product/{id}")
  // Future<Product> updateProduct(@Path() String id, @Body() Map<String, dynamic> map);
}