import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:volun_tek/src/features/home/domain/model/notification_model.dart';

class NotificationServices {
  final firestore = FirebaseFirestore.instance;

  // get all the notifications from the firestore
  Future<List<NotificationModel>> getNotifications() async {
    try {
      final snapshot = await firestore.collection('notifications').get();

      final notifications =
          snapshot.docs.map((doc) => NotificationModel.fromJson(doc.data())).toList();
      return notifications;
    } catch (e) {
      throw Exception(e);
    }
  }
}
