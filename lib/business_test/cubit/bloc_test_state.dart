// ignore_for_file: camel_case_types

part of 'bloc_test_cubit.dart';

@immutable
abstract  class BlocTestState {}

class BlocTestInitial extends BlocTestState {}

 class GetAllNoahState extends BlocTestState {
  final Series usersList;
  GetAllNoahState({required this.usersList});
}

class getAllYoussefSeries1State extends BlocTestState {
  final Series usersList;
  getAllYoussefSeries1State({required this.usersList});
}

class getAllYoussefSeries2State extends BlocTestState {
  final Series usersList;
  getAllYoussefSeries2State({required this.usersList});
}

class getAllkalem_allahSeries1State extends BlocTestState {
  final Series usersList;
  getAllkalem_allahSeries1State({required this.usersList});
}

class getAllkalem_allahSeries2State extends BlocTestState {
  final Series usersList;
  getAllkalem_allahSeries2State({required this.usersList});
}

class getAllAlrasol_MohamedSeries1State extends BlocTestState {
  final Series usersList;
  getAllAlrasol_MohamedSeries1State({required this.usersList});
}

class getAllAlrasol_MohamedSeries2State extends BlocTestState {
  final Series usersList;
  getAllAlrasol_MohamedSeries2State({required this.usersList});
}

class getAllAflamState extends BlocTestState {
  final Series usersList;
  getAllAflamState({required this.usersList});
}

class GetAllSeriesState extends BlocTestState {
  final List<Series> usersList;
  GetAllSeriesState({required this.usersList});
}

class getSeriesByIdState extends BlocTestState {
  final List<SeriesData> user;
  getSeriesByIdState({required this.user});
}


