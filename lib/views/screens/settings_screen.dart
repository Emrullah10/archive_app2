import 'package:archive_app2/utils/app_colors.dart';
import 'package:archive_app2/utils/app_pading.dart';
import 'package:archive_app2/views/screens/login_screen.dart';
import 'package:archive_app2/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // flutter_screenutil ekledim

class SettingPage extends StatelessWidget {
  final box = GetStorage(); // GetStorage instance
  final TextEditingController controller = TextEditingController();

  SettingPage({super.key}) {
    // Uygulama başlatıldığında daha önce kaydedilmiş URL'yi al
    String? savedUrl = box.read('serverUrl');
    if (savedUrl != null) {
      controller.text = savedUrl; // Kaydedilmiş URL'yi TextField'a yaz
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.borderColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Sunucu Ayarları'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(200),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/serdivan.png',
                    width: 150.w, // Esnek boyut
                    height: 150.h, // Esnek boyut
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.h), // Esnek üst padding
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(8.w), // Esnek padding
                        child: CustomTextFormField(
                          labelText: "Sunucu URL Giriniz",
                          backgroundColor: AppColors.backgroundColor,
                          controller: controller,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: AppPaddings.all20,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      box.write('serverUrl', controller.text); // URL'yi kaydet

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: SizedBox(
                    height: 50.h, // Esnek buton yüksekliği
                    width: 100.w, // Esnek buton genişliği
                    child: Padding(
                      padding: AppPaddings.all16,
                      child: Text(
                        'Kaydet',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp, // Esnek font boyutu
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
