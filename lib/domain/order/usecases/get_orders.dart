import 'package:dartz/dartz.dart';
import 'package:store_app/core/usecase/usecase.dart';
import 'package:store_app/domain/order/repository/order.dart';
import 'package:store_app/service_locator.dart';

class GetOrdersUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) {
    return sl<OrderRepository>().getOrders();
  }
}
