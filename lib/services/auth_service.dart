import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabaseClient = Supabase.instance.client;

  Future<AuthResponse> registerStudent({
    required String email,
    required String password,
    required String fullName,
    required String birthdate,
    required String gender,
    required bool isAdmin,
  }) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'fullName': fullName,
          'birthdate': birthdate,
          'gender': gender,
          'isAdmin': isAdmin,
        },
      );
      return response;
    } catch (e) {
      throw Exception('Ошибка регистрации: $e');
    }
  }


  Future<AuthResponse> registerEmployee({
    required String email,
    required String password,
    required String fullName,
    required String birthdate,
    required String gender,
    required String corporateEmail,
    required String position,
  }) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'fullName': fullName,
          'birthdate': birthdate,
          'gender': gender,
          'corporate_email': corporateEmail,
          'position': position,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  User? getCurrentUser() {
    return _supabaseClient.auth.currentUser;
  }
}
