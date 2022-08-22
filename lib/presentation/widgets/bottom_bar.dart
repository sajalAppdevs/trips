import 'package:flutter/material.dart';

import '../core/dimens.dart';

class BottomBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int)? onClick;
  final int selectedIndex;

  const BottomBar({
    Key? key,
    required this.icons,
    this.onClick,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).padding.bottom +
            kBottomNavigationBarHeight +
            sPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: icons
            .asMap()
            .entries
            .map(
              (item) => BottomBarItem(
                icon: item.value,
                selected: selectedIndex == item.key,
                onClick: () => onClick?.call(item.key),
              ),
            )
            .toList(),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final Function()? onClick;

  const BottomBarItem({
    Key? key,
    required this.icon,
    required this.selected,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onClick,
          icon: Icon(
            icon,
            color: selected
                ? theme.colorScheme.primary
                : theme.colorScheme.primaryContainer,
          ),
        ),
        if (selected) ...{
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.primary,
            ),
            width: 4,
            height: 4,
          )
        }
      ],
    );
  }
}
