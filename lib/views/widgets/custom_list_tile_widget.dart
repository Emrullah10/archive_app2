import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // flutter_screenutil ekledim

class CustomListTile extends StatelessWidget {
  final String folderNo;
  final String foldermean;
  final String folderDate;
  final String islem;
  final String parsel;
  final IconData icon;
  final VoidCallback onTap;

  const CustomListTile({
    super.key,
    required this.parsel,
    required this.folderNo,
    required this.folderDate,
    required this.foldermean,
    required this.islem,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 170.h, // Esnek yükseklik
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r), // Esnek border radius
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 40.w, color: Colors.blueAccent), // Esnek ikon boyutu
            SizedBox(width: 16.w), // Esnek genişlik
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Klasör No: ${folderNo}",
                    style: TextStyle(
                      fontSize: 18.sp, // Esnek font boyutu
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h), // Esnek yükseklik
                  Text(
                    "Konu: ${foldermean}",
                    style: TextStyle(
                      fontSize: 18.sp, // Esnek font boyutu
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h), // Esnek yükseklik
                  Text(
                    "Tarih: ${folderDate}",
                    style: TextStyle(
                      fontSize: 18.sp, // Esnek font boyutu
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h), // Esnek yükseklik
                  Text(
                    "Dosya İslem NO: ${islem}",
                    style: TextStyle(
                      fontSize: 18.sp, // Esnek font boyutu
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h), // Esnek yükseklik
                  Text(
                    "Parsel: ${parsel}",
                    style: TextStyle(
                      fontSize: 18.sp, // Esnek font boyutu
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20.w), // Esnek ikon boyutu
          ],
        ),
      ),
    );
  }
}
