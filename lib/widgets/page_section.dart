import 'package:flutter/material.dart';
import 'package:team_cost/utils/spacing.dart';

class PageSection extends StatelessWidget {
  final bool? enabled;
  final String title;
  final String? superScript;
  final Widget? trailing;
  const PageSection({
    Key? key,
    required this.title,
    this.trailing,
    this.superScript,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ContentPadding,
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: enabled == true ? Colors.black : Colors.grey,
                fontSize: 22,
              ),
              children: [
                WidgetSpan(
                  child: Transform.translate(
                    offset: const Offset(2, -8),
                    child: Text(
                      superScript ?? '',
                      textScaleFactor: 0.8,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) ...[
            const Spacer(),
            trailing ?? const SizedBox()
          ]
        ],
      ),
    );
  }
}
