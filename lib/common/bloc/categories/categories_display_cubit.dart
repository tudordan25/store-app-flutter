import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/common/bloc/categories/categories_display_state.dart';
import 'package:store_app/domain/category/usecases/get_categories.dart';
import 'package:store_app/service_locator.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUseCase>().call();
    returnedData.fold(
      (error) {
        emit(LoadCategoriesFailure());
      },
      (data) {
        emit(CategoriesLoaded(categories: data));
      },
    );
  }
}
