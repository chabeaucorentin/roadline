import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roadline/controllers/user_infos.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfosProvider = UserInfosProvider();

    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            left: kDefaultElementSpacing,
            top: kDefaultElementSpacing + 42.0,
            right: kDefaultElementSpacing,
            bottom: kDefaultElementSpacing,
          ),
          decoration: const BoxDecoration(
            color: kCardBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          width: double.infinity,
          margin: const EdgeInsets.only(
            top: 50.0,
          ),
          child: Column(
            children: <Widget>[
              StreamBuilder<String>(
                stream: userInfosProvider.fullNameStream,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Text(
                    snapshot.hasData && snapshot.data!.isNotEmpty
                        ? snapshot.data!
                        : 'Utilisateur',
                    style: const TextStyle(
                      color: kCardContentColor,
                      fontSize: kCardTitleFontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: kSpacingPadding,
              ),
              Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: const TextStyle(
                  color: kSecondaryColor,
                  fontSize: kBigFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: kCardBackgroundColor,
            shape: BoxShape.circle,
          ),
          width: 100.0,
          height: 100.0,
          child: const Icon(
            Icons.account_circle,
            size: 100.0,
            color: kCardContentColor,
          ),
        ),
      ],
    );
  }
}
