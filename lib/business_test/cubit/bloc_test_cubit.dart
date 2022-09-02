// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:muslim/data_test/my_repo.dart';


import '../../data_test/series_data.dart';
import '../../data_test/series_model.dart';

part 'bloc_test_state.dart';

class BlocTestCubit extends Cubit<BlocTestState> {
  final MyRepo myRepo;

  BlocTestCubit(this.myRepo) : super(BlocTestInitial());

  //  emitGetAllNoah() {
  //   // list = Series();
  //   myRepo.getAllNoahSeries().then(
  //     (usersList) {
  //       emit(
  //         GetAllNoahState(usersList: usersList),
  //       );
  //     },
  //   );
  // }

  //  getAllYoussefSeries1() {
  //   // list = Series();
  //   myRepo.getAllYoussefSeries1().then((usersList) {
  //     emit(getAllYoussefSeries1State(usersList: usersList));
  //   });
  // }

  //  getAllYoussefSeries2() {
  //   // list = Series();
  //   myRepo.getAllYoussefSeries2().then((usersList) {
  //     emit(getAllYoussefSeries2State(usersList: usersList));
  //   });
  // }

  //  getAllkalem_allahSeries1() {
  //   // list = Series();
  //   myRepo.getAllkalem_allahSeries1().then((usersList) {
  //     emit(getAllkalem_allahSeries1State(usersList: usersList));
  //   });
  // }

  //  getAllkalem_allahSeries2() {
  //   // list = Series();
  //   myRepo.getAllkalem_allahSeries2().then((usersList) {
  //     emit(getAllkalem_allahSeries2State(usersList: usersList));
  //   });
  // }

  //  getAllAlrasol_MohamedSeries1() {
  //   // list = Series();
  //   myRepo.getAllAlrasol_MohamedSeries1().then((usersList) {
  //     emit(getAllAlrasol_MohamedSeries1State(usersList: usersList));
  //   });
  // }

  //  getAllAlrasol_MohamedSeries2() {
  //   // list = Series();
  //   myRepo.getAllAlrasol_MohamedSeries2().then((usersList) {
  //     emit(getAllAlrasol_MohamedSeries2State(usersList: usersList));
  //   });
  // }

  getAllAflam() async {
    await myRepo.getAllAflam().then(
          (usersList) => emit(
            getAllAflamState(usersList: usersList),
          ),
        );
  }

  getAllSeries() async {
    await myRepo
        .getAllSeries()
        .then((usersList) => emit(GetAllSeriesState(usersList: usersList)));
  }


   emitGetSeriesById(String userId) {
   myRepo.getSeriesById(userId).then((usersList) {
      emit(getSeriesByIdState(user: usersList));
    });
  }

  // emitAddNewUser(Product userDetails) {
  //   myRepo
  //       .addNewUser(userDetails)
  //       .then((userData) => emit(AddNewUserState(user: userData)));
  // }

  // emitDeleteProduct(String id) {
  //   myRepo
  //       .deleteProductByID(id)
  //       .then((userData) => emit(deleteProductState(user: userData)));
  // }

  // emitupdateProduct(String id, Map<String, dynamic> map) {
  //   myRepo
  //       .updateProduct(id, map)
  //       .then((userData) => emit(updateProduct(user: userData)));
  // }
}
