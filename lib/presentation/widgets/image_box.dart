import 'package:flutter/material.dart';

import '../core/dimens.dart';

class ImageBox extends StatelessWidget {
  final String asset;
  final String text;
  final bool textWrap;
  final double padding;
  final Function()? onClick;

  const ImageBox({
    Key? key,
    required this.asset,
    required this.text,
    this.padding = sPadding,
    this.onClick,
    this.textWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const size = sPadding * 2;

    return SizedBox(
      width: size + padding * 2,
      child: Column(
        children: [
          InkWell(
            onTap: onClick,
            child: Container(
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: theme.colorScheme.primary,
              ),
              child: Image.asset(
                asset,
                height: size,
                width: size,
              ),
            ),
          ),
          vSpace(padding),
          Text(
            text,
            textAlign: TextAlign.center,
            overflow: textWrap ? null : TextOverflow.ellipsis,
            maxLines: textWrap ? null : 1,
            softWrap: textWrap,
          ),
        ],
      ),
    );
  }
}
