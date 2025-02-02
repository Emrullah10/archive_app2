import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // flutter_screenutil ekledim

class CustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Function()? onTap;
  final Color? color;

  // Constructor
  const CustomCard({
    super.key,
    this.color,
    required this.title,
    this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 80.h, // Esnek yükseklik
        child: Card(
          color: color,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r), // Esnek border radius
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w), // Esnek padding
            child: Row(
              children: [
                Icon(icon, size: 40.w, color: Colors.blue), // Esnek ikon boyutu
                SizedBox(width: 16.w), // Esnek genişlik
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h), // Esnek padding
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold), // Esnek font boyutu
                      ),
                    ),
                    SizedBox(height: 8.h), // Esnek yükseklik
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: TextStyle(
                            fontSize: 16.sp, color: Colors.grey[600]), // Esnek font boyutu
                      ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.w), // Esnek padding
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.w, // Esnek ikon boyutu
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
