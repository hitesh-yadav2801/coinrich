import 'package:coinrich/core/routes/routes.dart';
import 'package:coinrich/presentations/screens/home_screen.dart';
import 'package:coinrich/presentations/screens/splash_screen.dart';
import 'package:coinrich/providers/coin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoinProvider(), // Add a comma here
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: Routes.splash,
        onGenerateRoute: Routes.generateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}

