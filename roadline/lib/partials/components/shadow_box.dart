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
          height: kDefaultElementSpacing + kGradientHeight / 2.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kBackgroundColor.withOpacity(0.0),
                kBackgroundColor.withOpacity(0.75),
                kBackgroundColor,
              ],
              stops: const [
                0.0,
                (kGradientHeight / 1.5) /
                    (kDefaultElementSpacing + kGradientHeight / 2.0),
                (kGradientHeight) /
                    (kDefaultElementSpacing + kGradientHeight / 2.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
