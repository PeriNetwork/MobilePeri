import 'package:flutter/material.dart';
import 'package:peri_mobile_flutter/api/model/peri_notification.dart';
import 'package:peri_mobile_flutter/api/model/repository/peri_notification_repository.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget(
      {super.key,
      required this.notificationType,
      required this.userName,
      required this.notification});

  final IconData notificationType;
  final String userName;
  final PeriNotification notification;

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.1 * (MediaQuery.of(context).size.height),
      width: 0.8 * (MediaQuery.of(context).size.width),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              widget.notificationType,
              color: Colors.red,
              size: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    widget.userName,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.notificationType == Icons.thumb_up
                    ? "Curtiu seu post"
                    : "Adicionou um comentário",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
              ),
            ],
          ),
          /*
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    PeriNotificationRepository.deleteNotification(
                        widget.notification);
                  });
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 30,
                )),
          )
          */
        ],
      ),
    );
    ;
  }
}
