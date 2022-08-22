import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../core/assets.dart';
import '../core/dimens.dart';
import '../core/strings.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/image_box.dart';
import '../widgets/user_image.dart';
import 'notifications.dart';
import 'plans.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  bool _initialized = false;

  final items = const [
    Icons.home,
    Icons.bookmark,
    Icons.notifications,
  ];
  final pages = const [
    _DashboardScreen(),
    PlansScreen(),
    NotificationsScreen(),
  ];

  @override
  void didChangeDependencies() {
    if (!_initialized) {
      _selectedIndex = ModalRoute.of(context)?.settings.arguments as int? ?? 0;
      _initialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomBar(
        icons: items,
        selectedIndex: _selectedIndex,
        onClick: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    setState(() => _selectedIndex = index);
  }
}

class _DashboardScreen extends StatelessWidget {
  const _DashboardScreen({Key? key}) : super(key: key);

  static const _items = [
    [Strings.itinerary, Assets.itinerary],
    [Strings.flights, Assets.flights],
    [Strings.packHelp, Assets.packHelp],
    [Strings.leisure, Assets.leisure],
    [Strings.shortStay, Assets.shortStay],
    [Strings.map, Assets.map],
    [Strings.restaurants, Assets.restaurants],
    [Strings.drinks, Assets.drinks],
    [Strings.weather, Assets.weather],
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(sPadding),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.dashboardTitle,
                  style: theme.textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const UserImage(),
              ],
            ),
            const Text(Strings.dashboardSubtitle),
            ..._items.slices(3).map((row) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: sPadding + sSecondaryPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: row
                      .asMap()
                      .entries
                      .map(
                        (item) => ImageBox(
                          text: item.value[0],
                          asset: item.value[1],
                          padding: sSecondaryPadding,
                        ),
                      )
                      .toList(),
                ),
              );
            }),
            vSpace(sPadding + sSecondaryPadding),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: sPadding * 2,
                vertical: sPadding,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: theme.colorScheme.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.expensesPlanner,
                    style: theme.textTheme.bodyText2?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  Image.asset(Assets.expensesPlanner),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
