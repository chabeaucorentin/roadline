import 'package:flutter/material.dart';
import 'package:roadline/cards/task_card.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/bottom_widget.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/components/shadow_box.dart';
import 'package:roadline/partials/headers/project_header.dart';
import 'package:roadline/providers/project.dart';
import 'package:roadline/screens/add_task.dart';
import 'package:roadline/styles/constants.dart';

class ProjectScreen extends StatelessWidget {
  ProjectScreen({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final projectProvider = ProjectProvider(id: project.id!);

    return Screen(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ProjectHeader(project: project),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: kDefaultElementSpacing,
                          top: kDefaultElementSpacing * 1.5,
                          right: kDefaultElementSpacing,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: kMainMaxWidth,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Tâches',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: kCardTitleFontSize,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: kDefaultElementSpacing * 0.75,
                                ),
                                StreamBuilder<List<Task>>(
                                  stream: projectProvider.taskStream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<Task>> snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.active &&
                                        snapshot.hasData) {
                                      final tasks = snapshot.data;
                                      if (tasks != null && tasks.isNotEmpty) {
                                        return ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.only(),
                                          itemCount: tasks.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final task = tasks[index];
                                            return TaskCard(
                                              task: task,
                                            );
                                          },
                                        );
                                      }
                                    }

                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: kDefaultElementSpacing * 0.5,
                                          bottom: kDefaultElementSpacing * 1.75,
                                        ),
                                        child: snapshot.connectionState ==
                                                ConnectionState.waiting
                                            ? const CircularProgressIndicator()
                                            : const Text(
                                                'Aucune tâche',
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: kBigFontSize,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const ShadowBox(),
              ],
            ),
          ),
          BottomWidget(
            child: Button(
              'Ajouter une tâche',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTaskScreen.add(
                      project: project,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
