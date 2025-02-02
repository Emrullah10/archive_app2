import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // flutter_screenutil ekledim

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Üst kısmın Container'ı
          Container(
            height: MediaQuery.of(context).size.height * 0.4, // Esnek yükseklik
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(200.r), // Esnek border radius
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/serdivan.png', 
                width: 150.w, // Esnek genişlik
                height: 150.h, // Esnek yükseklik
              ),
            ),
          ),

          // Alt kısmın Expanded Container'ı
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  'Content below the control area',
                  style: TextStyle(fontSize: 16.sp), // Esnek font boyutu
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
