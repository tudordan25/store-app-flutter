import 'package:store_app/domain/order/entities/product_ordered.dart';

class CartHelper {
  static double calculateCartSubtotal(List<ProductOrderedEntity> products) {
    double subtotalPrice = 0;
    for (final item in products) {
      subtotalPrice += item.totalPrice;
    }
    return subtotalPrice;
  }
}
