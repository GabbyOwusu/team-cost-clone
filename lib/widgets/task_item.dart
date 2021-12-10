import 'package:flutter/material.dart';
import 'package:team_cost/models/tasks.dart';
import 'package:team_cost/utils/spacing.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ContentPadding,
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.speed_outlined),
            VSizedBox20,
            Text(
              task.body ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            VSizedBox40,
            Container(
              color: Colors.black,
              height: 2,
              width: 150,
            ),
            VSizedBox5,
            Expanded(
              child: Row(
                children: [
                  Text(
                    '${task.percentage}%',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text.rich(
                    TextSpan(
                      text: '\$${task.completed}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '/${task.completed}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
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
