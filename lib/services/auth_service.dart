import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabaseClient = Supabase.instance.client;

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final response = await _supabaseClient.auth.signUp(
          email: email,
          password: password,
          data: {
            'username': username,
          }
      );
      return response;
    } catch(e) {
      throw e;
    }
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
          email: email,
          password: password
      );
      return response;
    } catch(e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  User? getCurrentUser() {
    return _supabaseClient.auth.currentUser;
  }
}