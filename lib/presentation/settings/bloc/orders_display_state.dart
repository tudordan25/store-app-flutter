import 'package:store_app/domain/order/entities/order.dart';

abstract class OrdersDisplayState {}

class OrdersLoading extends OrdersDisplayState {}

class OrdersLoaded extends OrdersDisplayState {
  final List<OrderEntity> orders;

  OrdersLoaded({required this.orders});
}

class LoadOrderFailure extends OrdersDisplayState {
  final String errorMessage;

  LoadOrderFailure({required this.errorMessage});
}
