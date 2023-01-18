import 'package:flutter/material.dart';
import 'package:roadline/cards/task_card.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/bottom_widget.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/components/shadow_box.dart';
import 'package:roadline/partials/navbar/main_nav_bar.dart';
import 'package:roadline/partials/sidebar/side_bar.dart';
import 'package:roadline/providers/tasks.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final tasksProvider = TasksProvider();

    return Screen(
      mainKey: _key,
      drawer: const Drawer(
        child: SideBar(),
      ),
      child: Column(
        children: <Widget>[
          MainNavBar(
            mainKey: _key,
            title: 'Tâches',
          ),
          //const TasksTabBar(),
          Expanded(
            child: ColoredBox(
              color: kDarkBackgroundColor,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    StreamBuilder<List<Task>>(
                      stream: tasksProvider.taskStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Task>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active &&
                            snapshot.hasData) {
                          final tasks = snapshot.data;
                          if (tasks != null && tasks.isNotEmpty) {
                            return ListView.builder(
                              padding: const EdgeInsets.only(
                                left: kDefaultElementSpacing,
                                top: kDefaultElementSpacing,
                                right: kDefaultElementSpacing,
                              ),
                              itemCount: tasks.length,
                              itemBuilder: (BuildContext context, int index) {
                                final task = tasks[index];
                                return TaskCard(
                                  task: task,
                                );
                              },
                            );
                          }
                        }

                        return Center(
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
                          ),
                        );
                      },
                    ),
                    const ShadowBox(),
                  ],
                ),
              ),
            ),
          ),
          BottomWidget(
            child: Button(
              'Ajouter une tâche',
              onTap: () {
                Navigator.pushNamed(context, kAddTaskRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}
