import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/partials/navbar/project_nav_bar.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ProjectHeader extends StatelessWidget {
  const ProjectHeader({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: kDarkBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          const ProjectNavBar(),
          Padding(
            padding: const EdgeInsets.only(
              left: kDefaultElementSpacing,
              right: kDefaultElementSpacing,
              bottom: kDefaultElementSpacing * 2.0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: kMainMaxWidth,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: const BoxDecoration(
                        color: kCardBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.panorama,
                        size: 75.0,
                        color: kCardContentColor,
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultElementSpacing * 2.0 - 4.0,
                    ),
                    Text(
                      project.title,
                      style: const TextStyle(
                        color: kDarkLighterColor,
                        fontSize: kHeaderFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
