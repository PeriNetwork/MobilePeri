import 'package:flutter/material.dart';
import 'package:peri_mobile_flutter/api/model/peri_notification.dart';

class PeriNotificationRepository {
  static List<PeriNotification> periNotificationList = [];
  
  // add notification to list
  void addNotification(PeriNotification notification) {
    periNotificationList.add(notification);
  }

  // get notification list
  List<PeriNotification> getNotificationList() {
    return periNotificationList;
  }

  // print notification list
  void printNotificationList() {
    periNotificationList.forEach((element) {
      print(element.title);
    });
  }

  // delete notification
  static void deleteNotification(PeriNotification notification) {
    periNotificationList.remove(notification);
  }

  // generate 3 fake notifications and add them to the list
  PeriNotificationRepository() {
    periNotificationList.add(PeriNotification(Icons.notifications, title: "João", body: "Corpo da notificação 1"));
    periNotificationList.add(PeriNotification(Icons.notifications, title: "Maria", body: "Corpo da notificação 2"));
    periNotificationList.add(PeriNotification(Icons.notifications, title: "Vinícius", body: "Corpo da notificação 3"));
  }
}