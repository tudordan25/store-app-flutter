import 'package:store_app/data/order/models/order_status.dart';
import 'package:store_app/data/order/models/product_ordered.dart';
import 'package:store_app/domain/order/entities/order.dart';

class OrderModel {
  final List<ProductOrderedModel> products;
  final String createdDate;
  final int itemCount;
  final String shippingAddress;
  final double totalPrice;
  final String code;
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.products,
    required this.createdDate,
    required this.itemCount,
    required this.shippingAddress,
    required this.totalPrice,
    required this.code,
    required this.orderStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((e) => e.toMap()).toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'address': shippingAddress,
      'totalPrice': totalPrice,
      'code': code,
      'orderStatus': orderStatus.map((e) => e.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      products: List<ProductOrderedModel>.from(map['products']?.map((x) => ProductOrderedModel.fromMap(x))),
      createdDate: map['createdDate'] as String,
      itemCount: map['itemCount'] as int,
      shippingAddress: map['address'] as String,
      totalPrice: map['totalPrice'] as double,
      code: map['code'] as String,
      orderStatus: List<OrderStatusModel>.from(map['orderStatus']?.map((x) => OrderStatusModel.fromMap(x))),
    );
  }
}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      products: products.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      itemCount: itemCount,
      shippingAddress: shippingAddress,
      totalPrice: totalPrice,
      code: code,
      orderStatus: orderStatus.map((e) => e.toEntity()).toList(),
    );
  }
}
