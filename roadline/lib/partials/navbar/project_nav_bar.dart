import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roadline/controllers/project.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/providers/project.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ProjectNavBar extends StatelessWidget {
  const ProjectNavBar(
      {required this.project,
      super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final projectController = ProjectController(project);
    final projectProvider = ProjectProvider(id: project.id!);

    return ColoredBox(
      color: kDarkBackgroundColor,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: kSpacingPadding,
            horizontal: kDefaultElementSpacing - 5.0,
          ),
          color: kDarkBackgroundColor,
          constraints: const BoxConstraints(
            maxWidth: kMainMaxWidth + kDefaultElementSpacing * 2.0 - 1.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: kDefaultIconSize,
                    color: kDarkLighterColor,
                  ),
                ),
              ),
              const Spacer(),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => projectController.reverseFavorite(context),
                  child: StreamBuilder<Project>(
                    stream: projectProvider.projectStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<Project> snapshot) {
                      return Icon(
                        snapshot.hasData && snapshot.data!.isFavorite
                            ? Icons.star
                            : Icons.star_border,
                        size: kAdjustmentIconSize,
                        color: kDarkLighterColor,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: kDefaultElementSpacing,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: const Icon(
                    Icons.edit,
                    size: kAdjustmentIconSize,
                    color: kDarkLighterColor,
                  ),
                ),
              ),
              const SizedBox(
                width: kDefaultElementSpacing,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => projectController.delete(context),
                  child: const Icon(
                    Icons.delete,
                    size: kAdjustmentIconSize,
                    color: kDarkLighterColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
