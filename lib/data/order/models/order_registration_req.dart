import 'package:store_app/data/order/models/product_ordered.dart';
import 'package:store_app/domain/order/entities/product_ordered.dart';

class OrderRegistrationReq {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final int itemCount;
  final String shippingAddress;
  final double totalPrice;

  OrderRegistrationReq({
    required this.products,
    required this.createdDate,
    required this.itemCount,
    required this.shippingAddress,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((e) => e.fromEntity().toMap()).toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'address': shippingAddress,
      'totalPrice': totalPrice,
    };
  }
}
