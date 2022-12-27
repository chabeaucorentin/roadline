import 'package:flutter/material.dart';
import 'package:roadline/partials/components/bottom_padding.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class BottomWidget extends StatelessWidget {
  const BottomWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: kDefaultElementSpacing,
        right: kDefaultElementSpacing,
        bottom: kDefaultElementSpacing,
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: kMainMaxWidth,
              ),
              child: child,
            ),
          ),
          const BottomPadding(),
        ],
      ),
    );
  }
}
