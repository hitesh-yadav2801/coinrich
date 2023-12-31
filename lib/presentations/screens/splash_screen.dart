import 'package:coinrich/core/routes/routes.dart';
import 'package:coinrich/data/models/fetch_coins_model.dart';
import 'package:coinrich/data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<List<DataModel>> _futureCoins;
  late Repository repository;

  @override
  void initState() {
    repository = Repository();

    // Initialize _futureCoins with the result of repository.getCoins()
    _futureCoins = repository.getCoins().then((response) {
      return Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, Routes.home, arguments: response);
      }).then((_) => response);
    }).catchError((error) {
      // Handle errors here
      print("Error loading data: $error");
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
