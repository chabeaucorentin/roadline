import 'package:flutter/material.dart';
import 'package:roadline/partials/components/progress_bar.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ProjectCard extends StatefulWidget {
  const ProjectCard(
      {required this.name,
      required this.date,
      required this.nbCompleted,
      required this.nbTasks,
      super.key});

  final String name;
  final String date;
  final int nbCompleted;
  final int nbTasks;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: kCardBackgroundColor,
        borderRadius: kBorderRadius,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 75.0,
            width: 75.0,
            decoration: const BoxDecoration(
              color: kCardContentColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 75.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.name,
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
                      Text(
                        widget.date,
                        style: const TextStyle(
                          color: kSecondaryColor,
                          fontSize: kBigFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            widget.nbCompleted.toString(),
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
                            "/",
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
                            widget.nbTasks.toString(),
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
                    percent: widget.nbCompleted / widget.nbTasks,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}