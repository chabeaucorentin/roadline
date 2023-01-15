import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/bottom_padding.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/forms/date_picker.dart';
import 'package:roadline/partials/forms/desc_text_area.dart';
import 'package:roadline/partials/forms/project_name_input.dart';
import 'package:roadline/partials/forms/task_name_input.dart';
import 'package:roadline/partials/forms/time_picker.dart';
import 'package:roadline/partials/navbar/close_nav_bar.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final _asDate = ValueNotifier<bool>(true);
  final _asTime = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Column(
        children: <Widget>[
          const CloseNavBar(
            title: 'Ajouter une tâche',
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
                                  const TaskNameInput(),
                                  const SizedBox(
                                    height: kDefaultElementSpacing,
                                  ),
                                  //const ProjectNameInput(),
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
                                  //const DescTextArea(),
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
                                        controller: _asDate,
                                        activeColor: kSwitchColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: kDefaultElementSpacing,
                                  ),
                                  //const DatePicker(),
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
                                        controller: _asTime,
                                        activeColor: kSwitchColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: kDefaultElementSpacing,
                                  ),
                                  const TimePicker(),
                                  const SizedBox(
                                    height: kDefaultElementSpacing,
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Button(
                                    'Ajouter',
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, kRegisterRoute);
                                    },
                                  ),
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
