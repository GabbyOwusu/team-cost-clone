import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_cost/models/perk.dart';
import 'package:team_cost/provider/perk_provider.dart';
import 'package:team_cost/theme/colors.dart';
import 'package:team_cost/utils/spacing.dart';
import 'package:team_cost/widgets/page_section.dart';

class PerkDetails extends StatefulWidget {
  final Perk perk;
  const PerkDetails({Key? key, required this.perk}) : super(key: key);

  @override
  _PerkDetailsState createState() => _PerkDetailsState();
}

class _PerkDetailsState extends State<PerkDetails> {
  Perk get _perk => widget.perk;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PerkProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: UiColors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: ContentPadding,
              width: double.infinity,
              color: UiColors.orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _perk.category ?? '',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  VSizedBox5,
                  Padding(
                    padding: const EdgeInsets.only(right: 80),
                    child: Text(
                      _perk.title ?? '',
                      style: const TextStyle(fontSize: 54),
                    ),
                  ),
                  VSizedBox40,
                  Text.rich(
                    TextSpan(
                      text: '\$${_perk.amountUsed} remaining',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                      children: [
                        TextSpan(
                          text: ' from from \$${_perk.amount}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  VSizedBox10,
                  SizedBox(
                    height: 25,
                    child: LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: Colors.black.withOpacity(0.1),
                      valueColor: const AlwaysStoppedAnimation(Colors.black),
                    ),
                  ),
                  VSizedBox10,
                  Text(
                    'Next reload at December 1',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                  VSizedBox10,
                ],
              ),
            ),
            VSizedBox40,
            const PageSection(
              title: 'Your partners',
              superScript: '36',
              trailing: Icon(Icons.arrow_forward),
            ),
            VSizedBox10,
            SizedBox(
              height: 80,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: ContentPadding.left),
                scrollDirection: Axis.horizontal,
                itemCount: provider.fastFoodImages.length,
                separatorBuilder: (context, index) {
                  return Container(
                    color: Colors.black,
                    height: double.infinity,
                    width: 2,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 0 : 50,
                      right: 50,
                    ),
                    width: 80,
                    child: Image.asset(
                      provider.fastFoodImages[index],
                    ),
                  );
                },
              ),
            ),
            VSizedBox20,
            const PageSection(title: 'Recent spending'),
            ...List.generate(provider.fastFoodList.length, (index) {
              final data = provider.fastFoodList[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24,
                ),
                width: double.infinity,
                height: 80,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset(data.image!),
                  ),
                  title: Text(
                    data.name ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(data.day ?? ''),
                  trailing: Text(
                    '\$${data.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
