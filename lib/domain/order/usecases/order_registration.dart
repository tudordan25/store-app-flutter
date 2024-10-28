import 'package:dartz/dartz.dart';
import 'package:store_app/core/usecase/usecase.dart';
import 'package:store_app/data/order/models/order_registration_req.dart';
import 'package:store_app/domain/order/repository/order.dart';
import 'package:store_app/service_locator.dart';

class OrderRegistrationUseCase implements UseCase<Either, OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq? params}) async {
    return sl<OrderRepository>().orderRegistration(params!);
  }
}
