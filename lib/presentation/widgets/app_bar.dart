import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/dimens.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final Widget? trailing;
  final bool implyLeading;

  const DefaultAppBar({
    Key? key,
    this.title,
    this.leading,
    this.trailing,
    this.implyLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      foregroundColor: Colors.black,
      automaticallyImplyLeading: implyLeading,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: theme.colorScheme.primary,
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      leading: leading,
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            )
          : null,
      actions: trailing != null
          ? [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  trailing!,
                  hSpace(),
                ],
              )
            ]
          : null,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
