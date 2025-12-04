import 'package:go_router/go_router.dart';
import 'screens/intro_screen.dart';
import 'screens/mood_diving_screen.dart';
import 'screens/chat_screen.dart';
import 'models/image_item.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const IntroScreen()),
    GoRoute(
      path: '/dive/:mode',
      builder: (context, state) {
        final mode = state.pathParameters['mode'] ?? 'safe';
        return MoodDivingScreen(mode: mode);
      },
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final item = extra['item'] as ImageItem;
        final message = extra['message'] as String?;
        return ChatScreen(selectedItem: item, initialMessage: message);
      },
    ),
  ],
);
