import 'dart:io';

import 'package:archive_app2/data/services/auth_service.dart';
import 'package:archive_app2/views/screens/archive_detail.dart';
import 'package:archive_app2/views/screens/belgeler_screen.dart';
import 'package:archive_app2/views/screens/detail_search.dart';
import 'package:archive_app2/views/screens/home_screen.dart';
import 'package:archive_app2/views/screens/login_screen.dart';
import 'package:archive_app2/views/screens/onboarding_screen.dart';
import 'package:archive_app2/views/screens/server_control_screen.dart';
import 'package:archive_app2/views/screens/settings_screen.dart';
import 'package:archive_app2/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // GetStorage'ı başlatma
  HttpOverrides.global = PostHttpOverrides();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Archive App',
      initialRoute: '/splash', // Her açılışta SplashScreen göster
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => FutureBuilder<String?>(
              future: TokenManager.getToken(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Kullanıcının uygulamayı ilk kez açıp açmadığını kontrol et
                bool isFirstLaunch = GetStorage().read('isFirstLaunch') ?? true;

                if (isFirstLaunch) {
                  // İlk açılışta tanıtım ekranını göster
                  GetStorage().write('isFirstLaunch', false);
                  return IntroductionScreen();
                }

                // Sunucu URL'si yoksa settings ekranına git
                if (GetStorage().read('serverUrl') == null) {
                  return ServerControlPage();
                }

                // Eğer token yoksa, giriş ekranına yönlendir
                if (snapshot.data == null) {
                  return LoginPage();
                }

                // Token varsa ana sayfaya yönlendir
                return const HomePage();
              },
            ),
        '/login': (context) => LoginPage(),
        '/server': (context) => const ServerControlPage(),
        '/settings': (context) => SettingPage(),
        '/home': (context) => const HomePage(),
        '/intro': (context) => IntroductionScreen(),
        '/detail': (context) => const DetailPage(),
        '/search': (context) => const DetayliAramaPage(),
        '/belge': (context) => const BelgelerScreen(),
      },
    );
  }
}