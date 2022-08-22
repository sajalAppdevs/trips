import '../../presentation/core/assets.dart';
import '../../presentation/core/strings.dart';

class Plan {
  final String image, country;
  final double progress;
  final List<String> checklist;

  const Plan({
    required this.image,
    required this.country,
    required this.progress,
    required this.checklist,
  });
}

const sPlans = [
  Plan(
    image: Assets.austria,
    country: Strings.austria,
    progress: 0.1,
    checklist: [
      'Royal Air Maroc',
      'Brunswick Hotel',
      '2 mini tours',
      'Two items Packed',
    ],
  ),
  Plan(
    image: Assets.paris,
    country: Strings.paris,
    progress: 0.9,
    checklist: [
      'Emirate',
      'Air BnB',
      '2 mini tours',
      '15 items Packed',
    ],
  ),
  Plan(
    image: Assets.seychelles,
    country: Strings.seychelles,
    progress: 1,
    checklist: [
      'Qatar Airways',
      'Bayveiw Seychelles',
      'Sun bathing & Scuba',
      'All items Packed',
    ],
  ),
];
