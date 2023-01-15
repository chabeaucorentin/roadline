import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfosProvider {
  Stream<String> get fullNameStream => _getFullNameStream();

  Stream<String> _getFullNameStream() {
    final streamController = StreamController<String>();

    final authStateChangedSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists && snapshot.data()!.containsKey('fullName')) {
        streamController.add(snapshot['fullName']);
      } else {
        streamController.add('');
      }
    });

    streamController.onCancel = () {
      authStateChangedSubscription.cancel();
    };

    return streamController.stream;
  }
}
