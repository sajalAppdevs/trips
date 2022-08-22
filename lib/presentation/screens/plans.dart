import 'package:flutter/material.dart';

import '../../data/model/plan.dart';
import '../core/dimens.dart';
import '../core/strings.dart';
import '../widgets/plan.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({Key? key}) : super(key: key);

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
              Strings.plansTitle,
              style: theme.textTheme.headline5?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            ...sPlans.map((plan) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: sPadding + sSecondaryPadding,
                ),
                child: PlanWidget(plan),
              );
            }),
          ],
        ),
      ),
    );
  }
}
