import 'package:store_app/core/usecase/usecase.dart';
import 'package:store_app/domain/auth/repository/auth.dart';
import 'package:store_app/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({dynamic params}) async {
    return sl<AuthRepository>().isLoggedIn();
  }
}
