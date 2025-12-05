import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'theme/light_theme.dart';
import 'theme/dark_theme.dart';
import 'screens/home_screen.dart';
import 'screens/style_diagnosis_screen.dart';
import 'screens/style_result_screen.dart';
import 'screens/outfit_gallery_screen.dart';
import 'screens/essential_items_screen.dart';
import 'screens/shopping_tips_screen.dart';
import 'screens/seasonal_tips_screen.dart';

class StyleGuideApp extends StatelessWidget {
  const StyleGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '패션 스타일 가이드',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/style-guide',
      getPages: [
        GetPage(
          name: '/style-guide',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/diagnosis',
          page: () => const StyleDiagnosisScreen(),
        ),
        GetPage(
          name: '/result',
          page: () => const StyleResultScreen(),
        ),
        GetPage(
          name: '/outfit-gallery',
          page: () => const OutfitGalleryScreen(),
        ),
        GetPage(
          name: '/essential-items',
          page: () => const EssentialItemsScreen(),
        ),
        GetPage(
          name: '/shopping-tips',
          page: () => const ShoppingTipsScreen(),
        ),
        GetPage(
          name: '/seasonal-tips',
          page: () => const SeasonalTipsScreen(),
        ),
      ],
    );
  }
}

// 앱 초기화 및 실행
Future<void> runStyleGuideApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 환경변수 로드
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print("환경변수 로드 실패 (선택사항): $e");
  }

  runApp(const StyleGuideApp());
}
