import 'package:flutter/material.dart';

import '../../data/model/notification.dart';
import '../core/dimens.dart';
import '../core/strings.dart';
import '../widgets/notification.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final notifications = sNotifications.toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(sPadding),
          children: [
            Text(
              Strings.notificationsTitle,
              style: theme.textTheme.headline5?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            if (notifications.isNotEmpty) ...{
              ...notifications.asMap().entries.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: sPadding,
                  ),
                  child: NotificationWidget(
                    e.value,
                    variant: e.key % 2 != 0,
                    onRemove: () {
                      setState(() {
                        notifications.removeAt(e.key);
                      });
                    },
                  ),
                );
              }),
            } else ...{
              const NoNotificationWidget(),
            }
          ],
        ),
      ),
    );
  }
}
