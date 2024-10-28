import 'package:dartz/dartz.dart';
import 'package:store_app/core/usecase/usecase.dart';
import 'package:store_app/data/auth/models/user_signin_req.dart';
import 'package:store_app/domain/auth/repository/auth.dart';
import 'package:store_app/service_locator.dart';

class SigninUseCase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
