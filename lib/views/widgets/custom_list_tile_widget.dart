import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
        // Sabit yükseklik yerine içeriğe göre boyutlandırma sağlanıyor.
        // Eğer sabit yükseklik isteniyorsa, metinlerin taşmasını önlemek için FittedBox veya AutoSizeText kullanın.
        // height: 160.h,  // Bu satırı kaldırdık.
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r), // Esnek border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2.w, // Esnek spread radius
              blurRadius: 5.w,   // Esnek blur radius
              offset: Offset(0, 3.h), // Esnek offset
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 40.w, color: Colors.blueAccent), // Esnek ikon boyutu
            SizedBox(width: 16.w), // Esnek boşluk
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FittedBox ile metin alanına sığdırılıyor.
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Klasör No: $folderNo",
                      style: TextStyle(
                        fontSize: 18.sp, // Esnek font boyutu
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Konu: $foldermean",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tarih: $folderDate",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Dosya İşlem No: $islem",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Parsel: $parsel",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
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
