import 'package:clean_architecture_posts_app/features/auth/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/features/auth/domain/repositories/auth_repository.dart';

import '../../data/repositories/auth_repository.dart';

class SignupParams {
  final String email;
  final String password;

  SignupParams({required this.email, required this.password});
}

class Signup implements UseCase<void, SignupParams> {
  final AuthRepository repository;

  Signup(this.repository);

  @override
  Future<Either<Failure, void>> call(SignupParams params) async {
    return await repository.signup(params.email, params.password);
  }
}
