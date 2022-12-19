import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class SideBarButton extends StatelessWidget {
  const SideBarButton(
      {required this.icon,
      required this.label,
      this.counter,
      required this.route,
      super.key});

  final IconData icon;
  final String label;
  final int? counter;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: kDefaultElementSpacing - 2.0,
        ),
        color: ModalRoute.of(context)?.settings.name == route
            ? kSideBarSelectedBackgroundColor
            : kBackgroundColor,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 20.0,
              color: kPrimaryColor,
            ),
            const SizedBox(
              width: kDefaultElementSpacing,
            ),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: kDefaultFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (counter != null) ...[
              Text(
                counter.toString(),
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: kButtonFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
