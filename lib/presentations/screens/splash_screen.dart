import 'package:coinrich/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      // Initialize app logic (fetch data, handle loading)
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pushReplacementNamed(context, Routes.home);
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'animations/loading.json',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
                repeat: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
