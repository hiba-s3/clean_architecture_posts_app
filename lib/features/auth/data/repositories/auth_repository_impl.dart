import 'package:dartz/dartz.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_posts_app/features/auth/domain/repositories/auth_repository.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      await remoteDataSource.login(email, password);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signup(String email, String password) async {
    try {
      await remoteDataSource.signup(email, password);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
