import 'package:flutter/material.dart';
import 'package:team_cost/models/perk.dart';
import 'package:team_cost/utils/spacing.dart';

class PerkItem extends StatelessWidget {
  final Perk perk;
  const PerkItem({Key? key, required this.perk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ContentPadding,
      child: SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(perk.image!, width: 26),
            VSizedBox20,
            Text(
              perk.category ?? '',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            VSizedBox5,
            Text(
              perk.title ?? '',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            VSizedBox40,
            Container(
              color: Colors.black,
              height: 2,
              width: 100,
            ),
            VSizedBox5,
            Text.rich(
              TextSpan(
                text: '\$${perk.amountUsed}',
                style: const TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '/${perk.amountUsed}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
