import 'package:flutter/material.dart';

import '../core/dimens.dart';

class ImageBox extends StatelessWidget {
  final String asset;
  final String text;
  final double padding;
  final Function()? onClick;

  const ImageBox({
    Key? key,
    required this.asset,
    required this.text,
    this.padding = sPadding,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        InkWell(
          onTap: onClick,
          child: Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: theme.colorScheme.primary,
            ),
            child: Image.asset(asset),
          ),
        ),
        vSpace(padding),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
