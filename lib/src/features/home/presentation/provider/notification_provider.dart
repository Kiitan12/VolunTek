import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/features/home/application/services/notification_services.dart';
import 'package:volun_tek/src/features/home/domain/model/notification_model.dart';

final notificationProvider = StateProvider((ref) => []);

final notificationServiceProvider = StateProvider<NotificationServices>(
  (ref) => NotificationServices(),
);

final getNotification = FutureProvider<List<NotificationModel>>((ref) {
  final notification = ref.watch(notificationServiceProvider);

  return notification.getNotifications();
});
