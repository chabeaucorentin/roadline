import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:roadline/utils/status_bar.dart';

class UserInfosProvider {
  Stream<String> get fullNameStream => _getFullNameStream();

  Stream<String> _getFullNameStream() {
    final streamController = StreamController<String>();

    try {
      final authStateChangedSubscription =
          FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user != null) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .snapshots()
              .listen((snapshot) {
            if (snapshot.exists && snapshot.data()!.containsKey('fullName')) {
              streamController.add(snapshot['fullName']);
            } else {
              streamController.add('');
            }
          });
        } else {
          streamController.onCancel;
        }
      });

      streamController.onCancel = () {
        authStateChangedSubscription.cancel();
      };
    } on FirebaseException catch (e) {
      StatusBar.showErrorMessage(e.code);
    } on PlatformException catch (e) {
      StatusBar.showErrorMessage(e.code);
    }

    return streamController.stream;
  }
}
