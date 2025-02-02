import 'package:archive_app2/utils/app_colors.dart';
import 'package:archive_app2/utils/app_pading.dart';
import 'package:archive_app2/views/screens/login_screen.dart';
import 'package:archive_app2/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

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
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const SizedBox(
                    height: 50,
                    width: 100,
                    child: Padding(
                      padding: AppPaddings.all16,
                      child: Text(
                        'Kaydet',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
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
