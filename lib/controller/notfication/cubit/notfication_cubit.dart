import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/notfication/notification_model.dart';

class NotificationState {
  final List<NotificationItem> notifications;
  final bool isLoading;

  NotificationState({
    required this.notifications,
    this.isLoading = false,
  });

  NotificationState copyWith({
    List<NotificationItem>? notifications,
    bool? isLoading,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}


class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState(notifications: [], isLoading: true));

  Future<void> loadNotifications() async {
    try {
      emit(state.copyWith(isLoading: true));

      await Future.delayed(const Duration(seconds: 2)); // لمحاكاة التحميل
      final String response = await rootBundle.loadString('assets/json/notfication.json');
      final data = json.decode(response);
      final notificationsJson = data['Notifications'] as List;

      final notifications = notificationsJson
          .map((jsonItem) => NotificationItem.fromJson(jsonItem))
          .toList();
      Future.delayed(Duration(seconds: 1));
      emit(NotificationState(notifications: notifications, isLoading: false));
    } catch (e) {
      emit(NotificationState(notifications: [], isLoading: false));
    }
  }
}
