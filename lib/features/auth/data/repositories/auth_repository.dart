import 'package:dartz/dartz.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> signup(String email, String password);
}
