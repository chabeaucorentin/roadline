import 'package:flutter/material.dart';
import 'package:roadline/partials/components/progress_bar.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ProjectCard extends StatelessWidget {
  const ProjectCard(
      {required this.name,
      this.date,
      required this.nbCompleted,
      required this.nbTasks,
      super.key});

  final String name;
  final String? date;
  final int nbCompleted;
  final int nbTasks;

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
                Navigator.pushNamed(context, kProjectRoute);
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
                            name,
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
                              if (date != null) ...[
                                Text(
                                  date!,
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
                                    nbCompleted.toString(),
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
                                    nbTasks.toString(),
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
                            percent: nbCompleted / nbTasks,
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
