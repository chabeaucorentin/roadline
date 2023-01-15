import 'package:flutter/material.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/partials/components/progress_bar.dart';
import 'package:roadline/screens/project.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ProjectCard extends StatelessWidget {
  const ProjectCard({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: kDefaultElementSpacing,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: kMainMaxWidth,
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
                                  Text(
                                    '1',
                                    style: const TextStyle(
                                      color: kCardContentColor,
                                      fontSize: kBigFontSize,
                                      fontWeight: FontWeight.w900,
                                    ),
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
                                  Text(
                                    '2',
                                    style: const TextStyle(
                                      color: kSecondaryColor,
                                      fontSize: kBigFontSize,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: kSpacingPadding,
                          ),
                          ProgressBar(
                            percent: 0.5, //nbCompleted / nbTasks,
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
    );
  }
}
