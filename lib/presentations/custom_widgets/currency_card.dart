import 'package:coinrich/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name;
  final double price;
  final double change;
  final String symbol;
  final int rank;

  // Color customization
  final Color backgroundColor;
  final Color textColor;

  // Icon customization
  final IconData upIcon;
  final IconData downIcon;

  CurrencyCard({
    required this.name,
    required this.price,
    required this.change,
    required this.symbol,
    required this.rank,
    this.backgroundColor = MyColors.secondaryColor,
    this.textColor = MyColors.textColor,
    this.upIcon = Icons.arrow_upward,
    this.downIcon = Icons.arrow_downward,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Row with Currency Name, Percentage Change, and Currency Symbol
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(name,
                    style: const TextStyle(
                      color: MyColors.yellowColor,
                      fontSize: 24
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      // Customize the up and down icons based on the percentage change
                      Icon(change > 0 ? upIcon : downIcon, color: change > 0 ? Colors.green : Colors.red),
                      Text('$change%', style: TextStyle(color: textColor)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(symbol, style: TextStyle(color: textColor)),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Row with Price, Rank, and Next Icon Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price: \$$price', style: TextStyle(color: textColor)),
                Text('Rank: $rank', style: TextStyle(color: textColor)),
                Container(
                  decoration: const BoxDecoration(
                    color: MyColors.yellowColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    color: Colors.black,
                    onPressed: () {
                      // Handle button press
                    },
                    tooltip: 'Next',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
