import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:roadline/partials/buttons/bottom_button.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/image_selector.dart';
import 'package:roadline/partials/components/shadow_box.dart';
import 'package:roadline/partials/forms/date_picker.dart';
import 'package:roadline/partials/forms/desc_text_area.dart';
import 'package:roadline/partials/forms/project_name_input.dart';
import 'package:roadline/partials/navbar/nav_bar.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class NewProject extends StatelessWidget {
  NewProject({super.key});

  final _asDate = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const NavBar(
              title: 'Créer un projet',
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultElementSpacing),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: kMainMaxWidth,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const ImageSelector(),
                                const SizedBox(
                                  height: kDefaultElementSpacing,
                                ),
                                const ProjectNameInput(),
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
                                const DescTextArea(),
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
                                      controller: _asDate,
                                      activeColor: kSwitchColor,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: kDefaultElementSpacing,
                                ),
                                const DatePicker(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const ShadowBox(),
                  ],
                ),
              ),
            ),
            BottomButton(
              button: Button(
                'Créer',
                onTap: () {
                  Navigator.pushNamed(context, kRegisterRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
