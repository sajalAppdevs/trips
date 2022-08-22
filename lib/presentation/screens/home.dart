import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/assets.dart';
import '../core/dimens.dart';
import '../core/routes.dart';
import '../core/strings.dart';
import '../widgets/image_box.dart';
import '../widgets/user_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(Assets.homeBackground),
            Center(
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  const FractionallySizedBox(
                    widthFactor: 0.24,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: UserImage(),
                    ),
                  ),
                  vSpace(),
                  Text(
                    Strings.welcome,
                    style: theme.textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  vSpace(sSecondaryPadding),
                  const Text(
                    Strings.homeSubtitle,
                  ),
                  const Spacer(flex: 1),
                  Row(
                    children: [
                      const Spacer(flex: 3),
                      ImageBox(
                        asset: Assets.createTrip,
                        text: Strings.createTrip,
                        onClick: () {
                          Navigator.pushNamed(context, Routes.dashboard);
                        },
                      ),
                      const Spacer(flex: 1),
                      ImageBox(
                        asset: Assets.continuePlan,
                        text: Strings.continuePlan,
                        onClick: () {
                          Navigator.pushNamed(context, Routes.dashboard);
                        },
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                  const Spacer(flex: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
