import 'package:cyber_app/app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: '',
    anonKey: '',
  );
  runApp(const CyberApp());
}

