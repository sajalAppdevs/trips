import '../../presentation/core/assets.dart';
import '../../presentation/core/strings.dart';

class Notification {
  final String title, image, content, button;

  const Notification({
    required this.title,
    required this.image,
    required this.content,
    required this.button,
  });
}

const sNotifications = [
  Notification(
    title: Strings.flights,
    image: Assets.flights,
    content:
        'The flight to Morocco is cheaper now. Check Emirates and Air Maroc',
    button: 'Book Now',
  ),
  Notification(
    title: Strings.packHelp,
    image: Assets.packHelp,
    content:
        'Well done!\nYou have packed 15 items for you Seychelles Trip, You have 10 more items to pack.',
    button: 'Pack Now',
  ),
  Notification(
    title: Strings.weather,
    image: Assets.weather,
    content:
        'Have you checked the weather in seychelles for your planned trip?',
    button: 'Check Now',
  ),
  Notification(
    title: Strings.shortStay,
    image: Assets.shortStay,
    content:
        'Well done!\nYou have packed 15 items for you Seychelles Trip, You have 10 more items to pack.',
    button: 'Pack Now',
  ),
];
