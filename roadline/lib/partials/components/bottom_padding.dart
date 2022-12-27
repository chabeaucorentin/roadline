import 'package:flutter/material.dart';

@immutable
class BottomPadding extends StatelessWidget {
  const BottomPadding({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return SizedBox(
      height: bottomPadding,
    );
  }
}
