import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/order/usecases/get_orders.dart';
import 'package:store_app/presentation/settings/bloc/orders_display_state.dart';
import 'package:store_app/service_locator.dart';

class OrdersDisplayCubit extends Cubit<OrdersDisplayState> {
  OrdersDisplayCubit() : super(OrdersLoading());

  void displayOrders() async {
    var returnedData = await sl<GetOrdersUseCase>().call();

    returnedData.fold(
      (error) {
        emit(LoadOrderFailure(errorMessage: error));
      },
      (data) {
        emit(OrdersLoaded(orders: data));
      },
    );
  }
}
