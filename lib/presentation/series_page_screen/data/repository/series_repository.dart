import 'package:muslim/data_layer/models/failure_model.dart';

import '../../../../business_layer/generic_cubit/generic_cubit.dart';
import '../../../../data_layer/firestore_services.dart';
import '../../../../data_layer/models/category_model.dart';
import '../../../../data_layer/models/series_data_model.dart';

class SeriesRepository {
  FireStoreService fireStoreService = FireStoreService();

  GenericCubit<List<Category<SeriesData>>> getSeriesCategoriesCubit =
      GenericCubit<List<Category<SeriesData>>>([]);

  GenericCubit<Category<SeriesData>> getSeriesCategoryByIdCubit = GenericCubit<Category<SeriesData>>(
    Category<SeriesData>(
      title: "",
      id: "",
      backGImg: "",
      items: [SeriesData(title: "", link: "", imgUrl: "")],
    ),
  );

  Future<Category<SeriesData>> getSeriesCategoryById(String id) async {
    getSeriesCategoryByIdCubit.onLoadingState();
    try {
      var response = await fireStoreService.getSeriesCategoryById(id);
      getSeriesCategoryByIdCubit.onUpdateData(response);
      return response;
    } catch (e) {
      getSeriesCategoryByIdCubit.onErrorState(Failure(message: e.toString()));
      return Category<SeriesData>(title: "", id: "", backGImg: "", items: [
        SeriesData(title: "", link: "", imgUrl: ""),
      ]);
    }
  }

  Future<List<Category<SeriesData>>> getSeriesCategories() async {
    getSeriesCategoriesCubit.onLoadingState();
    try {
      var response = await fireStoreService.getSeriesCategories();
      getSeriesCategoriesCubit.onUpdateData(response);
      return response;
    } catch (e) {
      getSeriesCategoriesCubit.onErrorState(Failure(message: e.toString()));
      return [];
    }
  }
}
