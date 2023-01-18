import 'package:flutter/material.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/providers/projects.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ProjectDropdown extends StatefulWidget {
  const ProjectDropdown({required this.task, super.key});

  final Task task;

  @override
  State<ProjectDropdown> createState() => _ProjectDropdownState();
}

class _ProjectDropdownState extends State<ProjectDropdown> {
  late bool disabled = false;
  final listProjects = ProjectsProvider().projectStream.first;

  @override
  void initState() {
    super.initState();
    if (widget.task.projectId != null) {
      disabled = true;
    }
  }

  List<DropdownMenuItem> getProjectItems(List<Project> data) {
    List<DropdownMenuItem> projects = data.map((project) {
      final item = DropdownMenuItem(
        value: project.id,
        child: Text(project.title),
      );
      return item;
    }).toList();
    return projects;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: kDefaultPadding - 6.0,
      ),
      decoration: const BoxDecoration(
        color: kInputBackgroundColor,
        borderRadius: kBorderRadius,
      ),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kSpacingPadding,
            ),
            child: Icon(
              Icons.inventory_2,
              size: kDefaultInputIconSize,
              color: kInputContentColor,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: listProjects,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Project>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data!.isNotEmpty) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: getProjectItems(snapshot.data!),
                      value: widget.task.projectId ??
                          (widget.task.projectId = snapshot.data!.first.id),
                      onChanged: (value) {
                        if (!disabled) {
                          setState(() {
                            widget.task.projectId = value;
                          });
                        }
                      },
                      style: const TextStyle(
                        color: kInputContentColor,
                        fontSize: kInputFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: kAdjustmentIconSize,
                        color: kInputContentColor,
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(
                    top: kAdjustmentPadding - 2.0,
                    bottom: kAdjustmentPadding + 1.0,
                  ),
                  child: Text(
                    snapshot.connectionState == ConnectionState.waiting
                        ? 'Chargement...'
                        : 'Aucun projet',
                    style: const TextStyle(
                      color: kInputContentColor,
                      fontSize: kInputFontSize,
                      fontWeight: FontWeight.w500,
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
