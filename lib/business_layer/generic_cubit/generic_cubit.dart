import "package:flutter_bloc/flutter_bloc.dart";
import "package:equatable/equatable.dart";
import "../../data_layer/models/failure_model.dart";


part 'generic_state.dart';

class GenericCubit<T> extends Cubit<GenericCubitState<T>> {
  GenericCubit(T data) : super(GenericInitialState<T>(data));

  onUpdateData(T data) {
    emit(GenericUpdatedState<T>(data, !state.changed));
  }

  onLoadingState() {
    emit(GenericLoadingState<T>(data: state.data, changed: !state.changed));
  }


  onUpdateToInitState(T data) {
    emit(GenericInitialState<T>(data));
  }

  onErrorState(Failure responseError) {
    emit(GenericErrorState<T>(responseError: responseError, changed: !state.changed, data: state.data));
  }
}
