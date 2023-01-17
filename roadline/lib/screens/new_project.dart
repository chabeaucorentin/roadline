import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:roadline/controllers/project.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/bottom_padding.dart';
import 'package:roadline/partials/components/image_selector.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/forms/date_picker.dart';
import 'package:roadline/partials/forms/desc_text_area.dart';
import 'package:roadline/partials/forms/project_name_input.dart';
import 'package:roadline/partials/navbar/close_nav_bar.dart';
import 'package:roadline/styles/constants.dart';

class NewProjectScreen extends StatefulWidget {
  NewProjectScreen({super.key});

  NewProjectScreen.edit({required this.project, super.key}) {
    isEdit = true;
  }

  Project project = Project();
  bool isEdit = false;

  @override
  State<NewProjectScreen> createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {
  late ProjectController projectController;

  @override
  void initState() {
    super.initState();
    projectController = ProjectController(widget.project);
    projectController.hasDate.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    projectController.hasDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Column(
        children: <Widget>[
          CloseNavBar(
            title: widget.isEdit ? 'Modifier un projet' : 'Créer un projet',
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
                    child: Form(
                      key: projectController.formKey,
                      child: SingleChildScrollView(
                        child: Center(
                          child: Container(
                            padding:
                                const EdgeInsets.all(kDefaultElementSpacing),
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
                                    const ImageSelector(),
                                    const SizedBox(
                                      height: kDefaultElementSpacing,
                                    ),
                                    ProjectNameInput(
                                      project: projectController.project,
                                    ),
                                    const SizedBox(
                                      height: kDefaultElementSpacing - 4.0,
                                    ),
                                    const Text(
                                      'Description',
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: kBigFontSize,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: kSpacingPadding,
                                    ),
                                    DescTextArea.project(
                                      project: projectController.project,
                                    ),
                                    const SizedBox(
                                      height: kDefaultElementSpacing,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text(
                                          'Date de fin',
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: kBigFontSize,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        AdvancedSwitch(
                                          controller: projectController.hasDate,
                                          activeColor: kSwitchColor,
                                        ),
                                      ],
                                    ),
                                    if (projectController.hasDate.value) ...[
                                      const SizedBox(
                                        height: kDefaultElementSpacing,
                                      ),
                                      DatePicker.project(
                                        project: projectController.project,
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
                                            projectController.update(context),
                                      ),
                                    ] else ...[
                                      Button(
                                        'Créer',
                                        onTap: () =>
                                            projectController.create(context),
                                      ),
                                    ],
                                    const BottomPadding(),
                                  ],
                                )
                              ],
                            ),
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
