import 'package:dartz/dartz.dart';
import 'package:store_app/data/order/models/add_to_cart_req.dart';
import 'package:store_app/data/order/models/order.dart';
import 'package:store_app/data/order/models/order_registration_req.dart';
import 'package:store_app/data/order/models/product_ordered.dart';
import 'package:store_app/data/order/source/order_firebase_service.dart';
import 'package:store_app/domain/order/repository/order.dart';
import 'package:store_app/service_locator.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    return sl<OrderFirebaseService>().addToCart(addToCartReq);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await sl<OrderFirebaseService>().getCartProducts();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data).map((e) => ProductOrderedModel.fromMap(e).toEntity()).toList());
      },
    );
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    return sl<OrderFirebaseService>().removeCartProduct(id);
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq orderRegistrationReq) async {
    return sl<OrderFirebaseService>().orderRegistration(orderRegistrationReq);
  }

  @override
  Future<Either> getOrders() async {
    var returnedData = await sl<OrderFirebaseService>().getOrders();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data).map((e) => OrderModel.fromMap(e).toEntity()).toList());
      },
    );
  }
}
