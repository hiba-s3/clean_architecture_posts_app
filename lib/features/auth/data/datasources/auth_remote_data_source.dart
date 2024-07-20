
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<void> login(String email, String password);
  Future<void> signup(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<void> login(String email, String password) async {
    // Implement login API call
  }

  @override
  Future<void> signup(String email, String password) async {
    // Implement signup API call
  }
}
