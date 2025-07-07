import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/config/providers/bloc_provider.dart';
import 'package:prueba_tecnica_amaris_flutter/core/config/routes/app_routes.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProvider,
      child: mateApp(),
    );
  }

  Widget mateApp() => MaterialApp(
    title: 'Amaris Consulting Prueba Técnica',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    debugShowCheckedModeBanner: false,
    routes: appRoutes(),
    initialRoute: 'home',
  );
}
