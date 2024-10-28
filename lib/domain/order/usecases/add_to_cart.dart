import 'package:dartz/dartz.dart';
import 'package:store_app/core/usecase/usecase.dart';
import 'package:store_app/data/order/models/add_to_cart_req.dart';
import 'package:store_app/data/order/source/order_firebase_service.dart';
import 'package:store_app/service_locator.dart';

class AddToCartUseCase implements UseCase<Either, AddToCartReq> {
  @override
  Future<Either> call({AddToCartReq? params}) async {
    return sl<OrderFirebaseService>().addToCart(params!);
  }
}
