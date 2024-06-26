import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:roadline/controllers/project.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/partials/components/progress_bar.dart';
import 'package:roadline/providers/project.dart';
import 'package:roadline/screens/new_project.dart';
import 'package:roadline/screens/project.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ProjectCard extends StatelessWidget {
  const ProjectCard({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final projectController = ProjectController(project);
    final projectProvider = ProjectProvider(id: project.id!);

    return Padding(
      padding: const EdgeInsets.only(
        bottom: kDefaultElementSpacing,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: kMainMaxWidth,
          ),
          child: Slidable(
            key: Key(project.id!),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(
                onDismissed: () {
                  projectController.delete(context);
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
                        builder: (context) => NewProjectScreen.edit(
                          project: project,
                        ),
                      ),
                    );
                  },
                  icon: Icons.edit,
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(10.0)),
                ),
                SlidableAction(
                  onPressed: (BuildContext c) {
                    projectController.delete(context);
                  },
                  backgroundColor: kLogoutButtonBackgroundColor,
                  foregroundColor: kLogoutButtonContentColor,
                  icon: Icons.delete,
                  borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(10.0)),
                ),
              ],
            ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProjectScreen(
                        project: project,
                      ),
                    ),
                  );
                },
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
                      Container(
                        decoration: const BoxDecoration(
                          color: kCardContentColor,
                          shape: BoxShape.circle,
                        ),
                        width: 70.0,
                        height: 70.0,
                      ),
                      const SizedBox(
                        width: kDefaultPadding,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              project.title,
                              style: const TextStyle(
                                color: kCardContentColor,
                                fontSize: kCardTitleFontSize,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: kSpacingPadding - 4.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                if (project.endDate != null) ...[
                                  Text(
                                    project.endDate!,
                                    style: const TextStyle(
                                      color: kSecondaryColor,
                                      fontSize: kBigFontSize,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                                Row(
                                  children: <Widget>[
                                    StreamBuilder<int>(
                                      stream: projectProvider
                                          .taskCompletedCounterStream,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        return Text(
                                          snapshot.hasData
                                              ? snapshot.data!.toString()
                                              : '0',
                                          style: const TextStyle(
                                            color: kCardContentColor,
                                            fontSize: kBigFontSize,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: kSpacingPadding / 2.0,
                                    ),
                                    const Text(
                                      '/',
                                      style: TextStyle(
                                        color: kSecondaryColor,
                                        fontSize: kBigFontSize,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: kSpacingPadding / 2.0,
                                    ),
                                    StreamBuilder<int>(
                                      stream: projectProvider.taskCounterStream,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        return Text(
                                          snapshot.hasData
                                              ? snapshot.data!.toString()
                                              : '0',
                                          style: const TextStyle(
                                            color: kSecondaryColor,
                                            fontSize: kBigFontSize,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: kSpacingPadding,
                            ),
                            StreamBuilder<int>(
                              stream:
                                  projectProvider.taskCompletedCounterStream,
                              builder: (BuildContext c,
                                  AsyncSnapshot<int> taskCompleted) {
                                return StreamBuilder<int>(
                                  stream: projectProvider.taskCounterStream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<int> task) {
                                    return ProgressBar(
                                      percent: taskCompleted.hasData &&
                                              task.hasData &&
                                              task.data! > 0
                                          ? taskCompleted.data! / task.data!
                                          : 0,
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
