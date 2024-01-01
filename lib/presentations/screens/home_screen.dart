import 'package:coinrich/core/constants/my_colors.dart';
import 'package:coinrich/presentations/custom_widgets/currency_card.dart';
import 'package:coinrich/providers/coin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    //required this.data,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CoinProvider>(context, listen: false).getAllCoins();
    });
  }
  @override
  Widget build(BuildContext context) {
    // String? coinsCount = widget.coins.length.toString();
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
          child: Column(
            children: [
              // Header Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.show_chart, color: MyColors.textColor),
                        SizedBox(width: 8),
                        Text('Show Chart', style: TextStyle(color: MyColors.textColor)),
                      ],
                    ),

                    Consumer<CoinProvider>(
                      builder: (context, coinProvider, child) {
                        return Text(
                          'Count: ${coinProvider.coinsData.length}',
                          style: const TextStyle(color: MyColors.textColor),
                        );
                      },
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Consumer<CoinProvider>(
                  builder: (context, value, child) {
                    return value.isLoading ?
                      const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: value.coinsData.length,
                          itemBuilder: (context, index) {
                            var coin = value.coinsData[index];
                            return CurrencyCard(
                              name: coin.name,
                              price: coin.quoteModel.usdModel.price.toDouble().truncateToDouble(),
                              change: coin.quoteModel.usdModel.percentChange_24h.toDouble().truncateToDouble(),
                              symbol: coin.symbol,
                              rank: coin.cmcRank,
                            );
                      },
                    );
                  },
                ),
              )


              // Consumer<CoinProvider>(
              //   builder: (context, coinProvider, child) {
              //     return Column(
              //       children: coinProvider.coinsData.map((coin) {
              //         return CurrencyCard(
              //           name: coin.name,
              //           price: coin.quoteModel.usdModel.price.toDouble().truncateToDouble(),
              //           change: coin.quoteModel.usdModel.percentChange_24h.toDouble().truncateToDouble(),
              //           symbol: coin.symbol,
              //           rank: coin.cmcRank,
              //         );
              //       }).toList(),
              //     );
              //   },
              // ),

              // Currency Card
              // for (var coin in widget.coins )
              //   CurrencyCard(
              //     name: coin.name,
              //     price: coin.quoteModel.usdModel.price.toDouble().truncateToDouble(),
              //     change: coin.quoteModel.usdModel.percentChange_24h.toDouble().truncateToDouble(),
              //     symbol: coin.symbol,
              //     rank: coin.cmcRank,
              //   ),
              // Add more CurrencyCard widgets with different data as needed
            ],
          ),
        ),
      ),
    );
  }
}
