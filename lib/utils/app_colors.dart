// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  // Ana Renkler
  static const Color primaryColor = Color(0xFF1D3557); // Koyu Mavi
  static const Color secondaryColor = Color(0xFFE63946); // Kırmızı
  

  // Nötr Renkler
  static const Color backgroundColor = Color(0xFFF1FAEE); // Açık Arka Plan
  static const Color surfaceColor = Color(0xFFA8DADC); // Yüzey Rengi
  static const Color textColor = Color(0xFF457B9D); // Ana Metin Rengi

  // Yardımcı Renkler
  static const Color successColor = Color(0xFF4CAF50); // Başarı
  static const Color errorColor = Color(0xFFF44336); // Hata
  static const Color warningColor = Color(0xFFFFC107); // Uyarı

  // Gölge Renkleri
  static const Color shadowColor = Color(0x29000000); // Hafif Gölge (16%)
  static const Color borderColor = Color(0xFFB0BEC5); // Kenarlık Rengi

  // Opaklık Seviyeleri
  static Color primaryColorWithOpacity(double opacity) {

    return primaryColor.withOpacity(opacity);
  }

  static Color secondaryColorWithOpacity(double opacity) {
    return secondaryColor.withOpacity(opacity);
  }

  static Color backgroundColorWithOpacity(double opacity) {
    return backgroundColor.withOpacity(opacity);
  }
}
