import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit ile tasarım ölçülerini belirtin
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const IntroductionCard(
            bottomImagePath: 'assets/bottomImage.png',
            topPad: 20.0,
            leftPad: 10.0,
            rightPad: 10.0,
            bottomPad: 20.0,
          ),
        );
      },
    );
  }
}

class IntroductionCard extends StatelessWidget {
  final String bottomImagePath;
  final double height;
  final double width;

  // Padding değerlerini opsiyonel yapıyoruz ve varsayılan değer olarak 0.0 veriyoruz.
  final double topPad;
  final double leftPad;
  final double rightPad;
  final double bottomPad;

  const IntroductionCard({
    super.key,
    required this.bottomImagePath,
    this.height = 150.0,   // Varsayılan yükseklik değeri
    this.width = 150.0,    // Varsayılan genişlik değeri
    this.topPad = 0.0,     // Varsayılan üst padding
    this.leftPad = 0.0,    // Varsayılan sol padding
    this.rightPad = 0.0,   // Varsayılan sağ padding
    this.bottomPad = 0.0,  // Varsayılan alt padding
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Üst kısmın Container'ı
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(200.r),
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/bilicisoft.jpg',
                width: 150.w,
                height: 150.h,
              ),
            ),
          ),
          // Alt kısmın Expanded Container'ı
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    // ScreenUtil ile padding değerleri adaptif hale getiriliyor
                    padding: EdgeInsets.only(
                      top: topPad.h,
                      left: leftPad.w,
                      right: rightPad.w,
                      bottom: bottomPad.h,
                    ),
                    child: Image.asset(
                      bottomImagePath,
                      width: width.w,
                      height: height.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
