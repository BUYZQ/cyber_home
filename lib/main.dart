import 'package:cyber_app/app.dart';
import 'package:cyber_app/providers/user_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://gfnwrdnjaoummponhpzs.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdmbndyZG5qYW91bW1wb25ocHpzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA3NTYwNDEsImV4cCI6MjA1NjMzMjA0MX0.bNp9ejkVJ6dTNpVQu5w4qWixxJpDb7Yqp305-T0HphE',
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserImageProvider(),
      child: const CyberApp(),
    ),
  );
}
