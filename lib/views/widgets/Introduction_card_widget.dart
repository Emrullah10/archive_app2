import 'package:flutter/material.dart';

class IntroductionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(200), 
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/serdivan.png', 
                width: 150,
                height: 150, 
              ),
            ),
          ),

          
          Expanded(
            child: Container(
              color: Colors.grey[200], 
              child: Center(
                child: Text(
                  'Content below the control area',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
