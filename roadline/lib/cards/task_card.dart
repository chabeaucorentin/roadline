import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:roadline/controllers/task.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/screens/add_task.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class TaskCard extends StatelessWidget {
  const TaskCard({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final taskController = TaskController(task);

    return Padding(
      padding: const EdgeInsets.only(
        bottom: kDefaultElementSpacing,
      ),
      child: Slidable(
        key: Key(task.id!),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(
            onDismissed: () {
              taskController.delete(context);
            },
          ),
          children: <Widget>[
            SlidableAction(
              backgroundColor: kButtonBackgroundColor,
              foregroundColor: kButtonContentColor,
              onPressed: (BuildContext c) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTaskScreen.edit(
                      task: task,
                    ),
                  ),
                );
              },
              icon: Icons.edit,
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(10.0)),
            ),
            SlidableAction(
              onPressed: (BuildContext c) {
                taskController.delete(context);
              },
              backgroundColor: kLogoutButtonBackgroundColor,
              foregroundColor: kLogoutButtonContentColor,
              icon: Icons.delete,
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(10.0)),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(
            kDefaultPadding,
          ),
          decoration: const BoxDecoration(
            color: kCardBackgroundColor,
            borderRadius: kBorderRadius,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => taskController.reverseStatus(context),
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
                    if (task.projectTitle != null) ...[
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
                              task.projectTitle!,
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
                      ],
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
                      Row(
                        children: <Widget>[
                          Text(
                            task.date!,
                            style: const TextStyle(
                              color: kSecondaryColor,
                              fontSize: kBigFontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          if (task.time != null) ...[
                            const SizedBox(
                              width: kSpacingPadding / 2.0,
                            ),
                            const Text(
                              'à',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: kBigFontSize,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: kSpacingPadding / 2.0,
                            ),
                            Text(
                              task.time!,
                              style: const TextStyle(
                                color: kSecondaryColor,
                                fontSize: kBigFontSize,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
