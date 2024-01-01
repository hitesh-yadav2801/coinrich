import 'package:coinrich/data/repository/repository.dart';
import 'package:flutter/cupertino.dart';

import '../data/models/fetch_coins_model.dart';

class CoinProvider extends ChangeNotifier {
  final repository = Repository();
  bool isLoading = false;
  List<DataModel> _coinsData = [];
  List<DataModel> get coinsData => _coinsData;

  Future<void> getAllCoins() async {
    isLoading = true;
    notifyListeners();

    final response = await repository.getCoins();

    _coinsData = response;
    isLoading = false;
    notifyListeners();
  }
}