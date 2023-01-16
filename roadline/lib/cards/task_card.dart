import 'package:flutter/material.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class TaskCard extends StatelessWidget {
  const TaskCard({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        kDefaultPadding,
      ),
      decoration: const BoxDecoration(
        color: kCardBackgroundColor,
        borderRadius: kBorderRadius,
      ),
      margin: const EdgeInsets.only(
        bottom: kDefaultElementSpacing,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kCardContentColor,
                    width: 2.0,
                  ),
                  shape: BoxShape.circle,
                ),
                width: 30.0,
                height: 30.0,
                child: task.isCompleted
                    ? const Icon(
                        Icons.check,
                        size: 20.0,
                        color: kCardContentColor,
                      )
                    : null,
              ),
            ),
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /*if (widget.projectName != null) ...[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.inventory_2,
                        size: 15.0,
                        color: kCaptionColor,
                      ),
                      const SizedBox(
                        width: kSpacingPadding - 4.0,
                      ),
                      Text(
                        widget.projectName!,
                        style: const TextStyle(
                          color: kCaptionColor,
                          fontSize: kDefaultFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: kSpacingPadding - 4.0,
                  ),
                ],*/
                Text(
                  task.title,
                  style: const TextStyle(
                    color: kCardContentColor,
                    fontSize: kCardTitleFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (task.date != null) ...[
                  const SizedBox(
                    height: kSpacingPadding - 4.0,
                  ),
                  Text(
                    task.date!,
                    style: const TextStyle(
                      color: kSecondaryColor,
                      fontSize: kBigFontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
