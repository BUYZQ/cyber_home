import 'package:cyber_app/app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://qinuvrzekyclomaxeqwm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFpbnV2cnpla3ljbG9tYXhlcXdtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA0MTMyNDUsImV4cCI6MjA1NTk4OTI0NX0.xLR5idkI-5RzKschtryKlLbDEJmNDOBg5jDUxwWsiPA',
  );
  runApp(const CyberApp());
}

