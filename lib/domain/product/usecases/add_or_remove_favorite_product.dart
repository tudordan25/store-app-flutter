import 'package:dartz/dartz.dart';
import 'package:store_app/core/usecase/usecase.dart';
import 'package:store_app/domain/product/entities/product.dart';
import 'package:store_app/domain/product/repository/product.dart';
import 'package:store_app/service_locator.dart';

class AddOrRemoveFavoriteProductUseCase implements UseCase<Either, ProductEntity> {
  @override
  Future<Either> call({ProductEntity? params}) async {
    return await sl<ProductRepository>().addOrRemoveFavoriteProduct(params!);
  }
}
