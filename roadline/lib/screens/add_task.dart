import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:roadline/controllers/task.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/bottom_padding.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/forms/date_picker.dart';
import 'package:roadline/partials/forms/desc_text_area.dart';
import 'package:roadline/partials/forms/project_dropdown.dart';
import 'package:roadline/partials/forms/task_name_input.dart';
import 'package:roadline/partials/forms/time_picker.dart';
import 'package:roadline/partials/navbar/close_nav_bar.dart';
import 'package:roadline/styles/constants.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  AddTaskScreen.edit({required this.task, super.key}) {
    isEdit = true;
  }

  Task task = Task();
  bool isEdit = false;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TaskController taskController;

  @override
  void initState() {
    super.initState();
    taskController = TaskController(widget.task);
    taskController.hasDate.addListener(() {
      setState(() {
        if (!taskController.hasDate.value && taskController.hasTime.value) {
          taskController.hasTime.value = false;
        }
      });
    });
    taskController.hasTime.addListener(() {
      setState(() {
        if (!taskController.hasDate.value && taskController.hasTime.value) {
          taskController.hasDate.value = true;
        }
      });
    });
  }

  @override
  void dispose() {
    taskController.hasDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Column(
        children: <Widget>[
          CloseNavBar(
            title: widget.isEdit ? 'Modifier une tâche' : 'Ajouter une tâche',
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return ColoredBox(
                  color: kDarkBackgroundColor,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(kDefaultElementSpacing),
                          constraints: BoxConstraints(
                            maxWidth: kMainMaxWidth,
                            minHeight: constraints.maxHeight,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TaskNameInput(
                                    task: taskController.task,
                                  ),
                                  const SizedBox(
                                    height: kDefaultElementSpacing,
                                  ),
                                  ProjectDropdown(
                                    task: taskController.task,
                                  ),
                                  const SizedBox(
                                    height: kDefaultElementSpacing - 4.0,
                                  ),
                                  const Text(
                                    'Notes',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: kBigFontSize,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: kSpacingPadding,
                                  ),
                                  DescTextArea.task(
                                    task: taskController.task,
                                  ),
                                  const SizedBox(
                                    height: kDefaultElementSpacing,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Text(
                                        'Date',
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: kBigFontSize,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      AdvancedSwitch(
                                        controller: taskController.hasDate,
                                        activeColor: kSwitchColor,
                                      ),
                                    ],
                                  ),
                                  if (taskController.hasDate.value) ...[
                                    const SizedBox(
                                      height: kDefaultElementSpacing,
                                    ),
                                    DatePicker.task(
                                      task: taskController.task,
                                    ),
                                  ],
                                  const SizedBox(
                                    height: kDefaultElementSpacing,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Text(
                                        'Heure',
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: kBigFontSize,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      AdvancedSwitch(
                                        controller: taskController.hasTime,
                                        activeColor: kSwitchColor,
                                      ),
                                    ],
                                  ),
                                  if (taskController.hasTime.value) ...[
                                    const SizedBox(
                                      height: kDefaultElementSpacing,
                                    ),
                                    TimePicker(
                                      task: taskController.task,
                                    ),
                                  ],
                                  const SizedBox(
                                    height: kDefaultElementSpacing,
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  if (widget.isEdit) ...[
                                    Button(
                                      'Modifier',
                                      onTap: () =>
                                          taskController.update(context),
                                    ),
                                  ] else ...[
                                    Button(
                                      'Ajouter',
                                      onTap: () => taskController.add(context),
                                    ),
                                  ],
                                  const BottomPadding(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
