import 'package:coinrich/core/constants/my_colors.dart';
import 'package:coinrich/presentations/custom_widgets/currency_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/fetch_coins_model.dart';

class HomeScreen extends StatelessWidget {
  final List<DataModel> coins;
  const HomeScreen({
    Key? key,
    required this.coins,
    //required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? coinsCount = coins.length.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text(
          'CoinRich',
          style: TextStyle(
            color: MyColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 26
          ),
        ),
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: Container(
        color: MyColors.primaryColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header Row
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.show_chart, color: MyColors.textColor),
                          SizedBox(width: 8),
                          Text('Show Chart', style: TextStyle(color: MyColors.textColor)),
                        ],
                      ),
                      Text('Count: 100', style: TextStyle(color: MyColors.textColor)),
                    ],
                  ),
                ),

                // Currency Card
                for (var coin in coins )
                  CurrencyCard(
                    name: coin.name,
                    price: coin.quoteModel.usdModel.price.toDouble().truncateToDouble(),
                    change: coin.quoteModel.usdModel.percentChange_24h.toDouble().truncateToDouble(),
                    symbol: coin.symbol,
                    rank: coin.cmcRank,
                  ),
                // Add more CurrencyCard widgets with different data as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
