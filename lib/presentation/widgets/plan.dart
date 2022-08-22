import 'package:flutter/material.dart';

import '../../data/model/plan.dart';
import '../core/dimens.dart';

class PlanWidget extends StatefulWidget {
  final Plan plan;

  const PlanWidget(this.plan, {Key? key}) : super(key: key);

  @override
  State<PlanWidget> createState() => _PlanWidgetState();
}

class _PlanWidgetState extends State<PlanWidget> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final plan = widget.plan;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(sPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: theme.colorScheme.primary,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(plan.image),
          hSpace(sSecondaryPadding),
          Expanded(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plan.country,
                      style: theme.textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    vSpace(sSecondaryPadding),
                    ...plan.checklist.map(
                      (e) => Text(
                        '\u2022 $e',
                        style: theme.textTheme.overline?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    vSpace(sPadding / 3),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          plan.progress < 1
                              ? '${(plan.progress * 100).toInt()}% Completed'
                              : 'Done',
                          style: theme.textTheme.overline?.copyWith(
                            color: Colors.white,
                            fontSize: 6,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      selected = !selected;
                    }),
                    child: Icon(
                      selected
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
