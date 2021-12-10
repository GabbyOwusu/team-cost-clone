import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_cost/models/perk.dart';
import 'package:team_cost/provider/perk_provider.dart';
import 'package:team_cost/theme/colors.dart';
import 'package:team_cost/ui/perk_details.dart';
import 'package:team_cost/ui/score_screen.dart';
import 'package:team_cost/widgets/page_section.dart';
import 'package:team_cost/widgets/perk_item.dart';
import 'package:team_cost/utils/spacing.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Perk> get perkList => context.watch<PerkProvider>().perkDeatils;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: UiColors.lightBlue,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
                image: const DecorationImage(
                  image: AssetImage('images/profile.png'),
                ),
              ),
            ),
            HSizedBox20,
            const Text(
              'Hello, Judia!',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, color: Colors.black, size: 40),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: UiColors.lightBlue,
              padding: ContentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '\$1,026',
                    style: TextStyle(fontSize: 54),
                  ),
                  VSizedBox10,
                  const Text(
                    'Total perks balance\nfor this month.',
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                  VSizedBox40,
                  VSizedBox10,
                  const Divider(color: Colors.black, thickness: 1),
                  VSizedBox10,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your score',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          VSizedBox5,
                          Text(
                            'How to increase?',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      TextButton.icon(
                        icon: const Icon(Icons.speed, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return const ScoreScreen();
                              },
                            ),
                          );
                        },
                        label: const Text(
                          '8.3',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            VSizedBox20,
            const PageSection(
              title: 'Your perks',
              superScript: '7/12',
            ),
            VSizedBox10,
            SizedBox(
              height: 240,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: perkList.length,
                separatorBuilder: (context, index) {
                  return Container(
                    color: Colors.black,
                    height: double.infinity,
                    width: 2,
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) {
                            return PerkDetails(perk: perkList[index]);
                          },
                        ),
                      );
                    },
                    child: PerkItem(perk: perkList[index]),
                  );
                },
              ),
            ),
            VSizedBox40,
          ],
        ),
      ),
    );
  }
}
