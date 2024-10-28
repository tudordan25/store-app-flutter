import 'package:store_app/core/usecase/usecase.dart';
import 'package:store_app/domain/product/repository/product.dart';
import 'package:store_app/service_locator.dart';

class IsFavoriteUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<ProductRepository>().isFavorite(params!);
  }
}
