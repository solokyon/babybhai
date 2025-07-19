import 'package:babybhai/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  await Supabase.initialize(
    url: 'https://rzaeyddiszkopzeqogya.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6YWV5ZGRpc3prb3B6ZXFvZ3lhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI5MDYzMjcsImV4cCI6MjA2ODQ4MjMyN30.GLcoAR_NWSzZWSQjFJZ7nWyt0iHuVJxZENnfE_nB0BM',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Homepage()
    );
  }
}
