import 'package:flutter/material.dart';

import '../../data/model/notification.dart' as model;
import '../core/dimens.dart';
import '../core/strings.dart';

class NotificationWidget extends StatelessWidget {
  final model.Notification notification;
  final bool variant;
  final Function()? onRemove;

  const NotificationWidget(
    this.notification, {
    Key? key,
    this.variant = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(sPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: variant
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.primary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                notification.title,
                style: theme.textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: variant ? theme.colorScheme.primary : Colors.white,
                ),
              ),
              hSpace(sSecondaryPadding / 2),
              Image.asset(
                notification.image,
                width: sPadding,
                height: sPadding,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onRemove,
                child: Icon(
                  Icons.close,
                  color: variant ? theme.colorScheme.primary : Colors.white,
                ),
              ),
            ],
          ),
          vSpace(sPadding / 4),
          Text(
            notification.content,
            style: theme.textTheme.overline?.copyWith(
              color: variant ? null : Colors.white,
            ),
          ),
          vSpace(sPadding / 4),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: sSecondaryPadding / 2,
                  vertical: sSecondaryPadding / 4,
                ),
                decoration: BoxDecoration(
                  color: variant ? theme.colorScheme.primary : Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  notification.button,
                  style: theme.textTheme.overline?.copyWith(
                    color: variant ? Colors.white : theme.colorScheme.primary,
                  ),
                ),
              ),
              hSpace(sPadding),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: sSecondaryPadding / 2,
                  vertical: sSecondaryPadding / 4,
                ),
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: variant
                          ? theme.textTheme.bodyText1?.color ?? Colors.white
                          : Colors.white,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  Strings.later,
                  style: theme.textTheme.overline?.copyWith(
                    color: variant ? null : Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NoNotificationWidget extends StatelessWidget {
  const NoNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(sPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: theme.colorScheme.primary,
      ),
      child: Text(
        Strings.noNotification,
        style: theme.textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
