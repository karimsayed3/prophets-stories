import 'package:muslim/data_layer/models/failure_model.dart';
import '../../../business_layer/generic_cubit/generic_cubit.dart';
import '../../../data_layer/firestore_services.dart';
import '../../../data_layer/models/category_model.dart';
import '../../../data_layer/models/film_data_model.dart';
import '../../../data_layer/series_model.dart';

class AflamRepository {
  FireStoreService fireStoreService = FireStoreService();

  GenericCubit<List<FilmData>> getAllAflamCubit =
      GenericCubit<List<FilmData>>([]);

  GenericCubit<List<Category<FilmData>>> getFilmCategoryByIdCubit =
      GenericCubit<List<Category<FilmData>>>([]);

  Future<List<FilmData>> getAllAflam() async {
    getAllAflamCubit.onLoadingState();
    try {
      var response = await fireStoreService.getFilms();
      getAllAflamCubit.onUpdateData(response);
      return response;
    } catch (e) {
      getAllAflamCubit.onErrorState(Failure(message: e.toString()));
      return [];
    }
  }


}
