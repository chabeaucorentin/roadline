import 'dart:async';
import 'dart:io';

import 'package:intl/intl.dart';

class DateTimeProvider {
  Stream<DateTime> get dateTimeStream => _getDateTimeStream();

  Stream<String> get dateStream => _getDateStream();

  Stream<DateTime> _getDateTimeStream() {
    final streamController = StreamController<DateTime>();

    streamController.add(DateTime.now());
    final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      streamController.add(DateTime.now());
    });

    streamController.onCancel = () {
      timer.cancel();
    };

    return streamController.stream;
  }

  Stream<String> _getDateStream() {
    final streamController = StreamController<String>();
    final locale = Platform.localeName;
    String currentDate = '';

    final dateTimeSubscription = dateTimeStream.listen((dateTime) {
      String newDate = DateFormat('EEEE, d MMMM y', locale).format(DateTime.now());
      newDate = newDate[0].toUpperCase() + newDate.substring(1);
      if (currentDate != newDate) {
        currentDate = newDate;
        streamController.add(currentDate);
      }
    });

    streamController.onCancel = () {
      dateTimeSubscription.cancel();
    };

    return streamController.stream;
  }
}
