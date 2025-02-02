import 'package:archive_app2/views/screens/onboarding_screen.dart';
import 'package:archive_app2/views/screens/server_control_screen.dart';
import 'package:archive_app2/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // flutter_screenutil ekledim

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    // Splash süresi sonunda gerekli ekrana geçiş
    Future.delayed(const Duration(seconds: 3), () {
      navigateToNextScreen();
    });
  }

  void navigateToNextScreen() {
    final box = GetStorage();
    bool isFirstLaunch = box.read('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      // İlk açılışta tanıtım ekranını göster
      box.write('isFirstLaunch', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroductionScreen()),
      );
    } else if (box.read('serverUrl') == null) {
      // Sunucu URL'si yoksa sunucu kontrol ekranına git
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ServerControlPage()),
      );
    } else {
      // Sunucu URL'si varsa, direkt olarak giriş ekranına yönlendir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/serdivan.png',
                height: 100.h,  // Esnek logo boyutu
                width: 100.w,  // Esnek logo boyutu
              ),
              const SizedBox(height: 20),
              Text(
                'SERDİVAN BELEDİYESİ',
                style: TextStyle(
                  fontSize: 24.sp,  // Esnek font boyutu
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
