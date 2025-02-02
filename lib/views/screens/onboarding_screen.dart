
import 'package:archive_app2/views/screens/server_control_screen.dart';
import 'package:archive_app2/views/widgets/Introduction_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Page indicator paketi

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  // Kartları oluşturan fonksiyon
  List<Widget> _buildPages() {
    return [
      IntroductionCard(),
      IntroductionCard(),
      IntroductionCard(),
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
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius:
                    BorderRadius.circular(20), // Köşeleri ovalleştirme
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServerControlPage()),
                      );
                    },
                    child: Text('Tanıtımı Geç',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: _buildPages().length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
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
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      // İleri Butonu
                      if (_currentPage != _buildPages().length - 1)
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      // Tamam Butonu (son sayfa)
                      if (_currentPage == _buildPages().length - 1)
                        IconButton(
                          color: Colors.green,
                          icon: Icon(Icons.done),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServerControlPage()),
                            );
                          },
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
