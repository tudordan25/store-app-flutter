import 'package:store_app/domain/product/entities/product.dart';

class ProductPriceHelper {
  static double provideCurrentPrice(ProductEntity productEntity) {
    return productEntity.discountedPrice != 0 ? productEntity.discountedPrice.toDouble() : productEntity.price.toDouble();
  }
}
