import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_cost/provider/perk_provider.dart';
import 'package:team_cost/theme/colors.dart';
import 'package:team_cost/utils/spacing.dart';
import 'package:team_cost/widgets/page_section.dart';
import 'package:team_cost/widgets/task_item.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PerkProvider>();
    final taskList = provider.taskDetails;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 520,
              padding: const EdgeInsets.only(top: 40),
              decoration: const BoxDecoration(color: UiColors.green),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/meter.png',
                    height: 500,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        '8.3',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 50,
                        ),
                      ),
                      VSizedBox20,
                      const Text(
                        'Your score level is good',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                      VSizedBox10,
                      Text(
                        'The more KPI\'s and work activity you\nreach, the higher score level you have,\nthe more benefits you get.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 16,
                        ),
                      ),
                      VSizedBox40,
                      VSizedBox40,
                    ],
                  ),
                ],
              ),
            ),
            VSizedBox20,
            Row(
              children: const [
                PageSection(title: 'Open', superScript: '6'),
                PageSection(
                  title: 'Done',
                  superScript: '13',
                  enabled: false,
                ),
              ],
            ),
            SizedBox(
              height: 240,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: taskList.length,
                separatorBuilder: (context, index) {
                  return Container(
                    color: Colors.black,
                    height: double.infinity,
                    width: 2,
                  );
                },
                itemBuilder: (context, index) {
                  return TaskItem(task: taskList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
