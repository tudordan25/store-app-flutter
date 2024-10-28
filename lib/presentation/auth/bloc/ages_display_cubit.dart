import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/auth/usecases/get_ages.dart';
import 'package:store_app/presentation/auth/bloc/ages_display_states.dart';
import 'package:store_app/service_locator.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesLoading());

  void displayAges() async {
    var returnedData = await sl<GetAgesUseCase>().call();

    returnedData.fold(
      (message) {
        emit(AgesLoadFailure(message: message));
      },
      (data) {
        emit(AgesLoaded(ages: data));
      },
    );
  }
}
