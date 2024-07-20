import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/features/auth/domain/usecases/login.dart';
import 'package:clean_architecture_posts_app/features/auth/domain/usecases/signup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Signup signup;

  AuthBloc({required this.login, required this.signup}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield AuthLoading();
      final failureOrSuccess = await login(LoginParams(email: event.email, password: event.password));
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
    } else if (event is SignupEvent) {
      yield AuthLoading();
      final failureOrSuccess = await signup(SignupParams(email: event.email, password: event.password));
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
    }
  }

  Stream<AuthState> _eitherLoadedOrErrorState(
    Either<Failure, void> failureOrSuccess,
  ) async* {
    yield failureOrSuccess.fold(
      (failure) => AuthError(message: _mapFailureToMessage(failure)),
      (_) => AuthSuccess(),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
