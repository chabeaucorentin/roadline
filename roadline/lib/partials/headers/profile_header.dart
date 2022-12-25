import 'package:flutter/material.dart';
import 'package:roadline/cards/profile_card.dart';
import 'package:roadline/partials/navbar/back_nav_bar.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: kDarkBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          const BackNavBar(
            title: 'Profil',
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kDefaultElementSpacing,
              top: kDefaultElementSpacing,
              right: kDefaultElementSpacing,
              bottom: kDefaultElementSpacing * 2.0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: kMainMaxWidth,
                ),
                child: const ProfileCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
