import 'package:store_app/domain/order/entities/order_status.dart';
import 'package:store_app/domain/order/entities/product_ordered.dart';

class OrderEntity {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final int itemCount;
  final String shippingAddress;
  final double totalPrice;
  final String code;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity({
    required this.products,
    required this.createdDate,
    required this.itemCount,
    required this.shippingAddress,
    required this.totalPrice,
    required this.code,
    required this.orderStatus,
  });
}
