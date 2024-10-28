import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/order/entities/product_ordered.dart';
import 'package:store_app/domain/order/usecases/get_cart_products.dart';
import 'package:store_app/domain/order/usecases/remove_cart_product.dart';
import 'package:store_app/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:store_app/service_locator.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDisplayState> {
  CartProductsDisplayCubit() : super(CartProductsLoading());

  void displayCartProducts() async {
    var returnedData = await sl<GetCartProductsUseCase>().call();

    returnedData.fold(
      (error) {
        emit(CartProductsFailure(errorMessage: error));
      },
      (data) {
        emit(CartProductsLoaded(products: data));
      },
    );
  }

  void removeProduct(ProductOrderedEntity product) async {
    emit(CartProductsLoading());

    var returnedData = await sl<RemoveCartProductUseCase>().call(params: product.id);

    returnedData.fold(
      (error) {
        emit(CartProductsFailure(errorMessage: error));
      },
      (data) {
        displayCartProducts();
      },
    );
  }
}
