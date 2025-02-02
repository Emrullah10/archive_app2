import 'package:archive_app2/views/screens/server_control_screen.dart';
import 'package:archive_app2/views/widgets/Introduction_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Page indicator paketi
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Kartları oluşturan fonksiyon
  List<Widget> _buildPages() {
    return [
      const IntroductionCard(),
      const IntroductionCard(),
      const IntroductionCard(),
      // İstediğin kadar kart ekleyebilirsin
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: _buildPages(),
          ),
          Positioned(
            bottom: 20.h, // Esnek bottom padding
            left: 20.w,  // Esnek left padding
            right: 20.w, // Esnek right padding
            child: Container(
              height: 70.h,  // Esnek height
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h), // Esnek padding
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(20), // Köşeleri ovalleştirme
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ServerControlPage()),
                      );
                    },
                    child: Text(
                      'Tanıtımı Geç',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,  // Esnek font boyutu
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),  // Esnek padding
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: _buildPages().length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10.h,  // Esnek dot height
                        dotWidth: 10.w,   // Esnek dot width
                        activeDotColor: Colors.green, // Aktif noktaların rengi
                        dotColor: Colors.grey, // Pasif noktaların rengi
                      ),
                    ),
                  ),
                  // Geri Butonu
                  Row(
                    children: [
                      if (_currentPage != 0)
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      // İleri Butonu
                      if (_currentPage != _buildPages().length - 1)
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      // Tamam Butonu (son sayfa)
                      if (_currentPage == _buildPages().length - 1)
                        IconButton(
                          color: Colors.green,
                          icon: const Icon(Icons.done),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ServerControlPage()),
                            );
                          },
                        ),
                    ],
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
