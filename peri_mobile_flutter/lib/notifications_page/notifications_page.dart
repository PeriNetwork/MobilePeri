// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:peri_mobile_flutter/api/model/repository/peri_notification_repository.dart';

import '../peri_nav_bar.dart';
import 'notification_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    PeriNotificationRepository periNotificationRepository =
        PeriNotificationRepository();
    return Align(
      alignment: Alignment(1, 1),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Align(
                alignment: Alignment(0, -1),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListView(
                        shrinkWrap: true,
                        children: [
                          NotificationWidget(
                            notificationType: periNotificationRepository
                                .getNotificationList()[index]
                                .icon,
                            userName: periNotificationRepository
                                .getNotificationList()[index]
                                .title,
                            notification: periNotificationRepository.getNotificationList()[index],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: periNotificationRepository
                        .getNotificationList()
                        .length))),
        appBar: PreferredSize(
            child: PeriNavBar(), preferredSize: const Size.fromHeight(50)),
      ),
    );
  }
}
