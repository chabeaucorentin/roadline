import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ShadowBox extends StatelessWidget {
  const ShadowBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Container(
          height: kDefaultElementSpacing,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kBackgroundColor.withOpacity(0.0),
                kBackgroundColor.withOpacity(0.5),
                kBackgroundColor,
              ],
              stops: const [
                0.0,
                (kGradientHeight / 2.0) / kDefaultElementSpacing,
                kGradientHeight / kDefaultElementSpacing,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
