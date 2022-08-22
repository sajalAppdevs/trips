import 'package:flutter/material.dart';
import '../core/dimens.dart';
import '../core/strings.dart';
import '../widgets/app_bar.dart';
import '../widgets/user_image.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  static const _items = [
    {
      'icon': Icons.person_outline_outlined,
      'title': 'Profile',
      'content': 'Manage Changes to your account',
    },
    {
      'icon': Icons.credit_card_outlined,
      'title': 'Cards',
      'content': 'Secure your cards for safety',
    },
    {
      'icon': Icons.settings_outlined,
      'title': 'Preferences',
      'content': 'Customize you app',
    },
    {
      'icon': Icons.logout_outlined,
      'title': 'Logout',
      'content': 'Logout for your account',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;

    return Scaffold(
      appBar: const DefaultAppBar(
        title: Strings.myAccountTitle,
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(sPadding),
          children: [
            ListTile(
              tileColor: theme.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              leading: const SizedBox(
                height: 68,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: UserImage(),
                ),
              ),
              title: Text(
                'Olivia Scott',
                style: theme.textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'UI/UX Designer',
                style: theme.textTheme.overline?.copyWith(
                  color: Colors.white,
                ),
              ),
              trailing: const Icon(
                Icons.edit_outlined,
                color: Colors.white,
              ),
            ),
            vSpace(sPadding * 2),
            Card(
              elevation: 2,
              child: ListView.separated(
                padding: const EdgeInsets.only(top: sSecondaryPadding),
                shrinkWrap: true,
                itemBuilder: (_, i) => ListTile(
                  leading: Icon(
                    _items[i]['icon'] as IconData,
                    color: color,
                  ),
                  title: Text(
                    _items[i]['title'] as String,
                    style: theme.textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                  ),
                  subtitle: Text(
                    _items[i]['content'] as String,
                    style: theme.textTheme.overline?.copyWith(
                      color: color,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next_outlined,
                    color: color,
                  ),
                ),
                separatorBuilder: (_, __) => Divider(
                  color: color,
                ),
                itemCount: _items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
