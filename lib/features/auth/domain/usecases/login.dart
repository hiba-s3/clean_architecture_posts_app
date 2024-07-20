
import 'package:clean_architecture_posts_app/features/auth/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/features/auth/domain/repositories/auth_repository.dart';

import '../../data/repositories/auth_repository.dart';

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}

class Login implements UseCase<void, LoginParams> {
  final AuthRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, void>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}
