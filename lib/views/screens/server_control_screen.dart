import 'package:archive_app2/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // flutter_screenutil ekledim

class ServerControlPage extends ConsumerWidget {
  const ServerControlPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const warningText = "Sunucu ayarlarını yapmak için tıklayınız.";
    const settingText = "Ayarlar";
    const warning2text =
        "Uygulamayı kullanabilmek için sunucu ayarlarını yapmalısınız.";

    return Scaffold(
      backgroundColor: AppColors.borderColor,
      body: Center(
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
                  width: 150.w,  // Esnek genişlik
                  height: 150.h, // Esnek yükseklik
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.h),  // Esnek padding
              child: Text(
                warning2text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 30.sp,  // Esnek font boyutu
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 80.h, left: 20.w, right: 20.w, bottom: 20.h),  // Esnek padding
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.h),  // Esnek padding
                      child: Text(
                        warningText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: 27.sp,  // Esnek font boyutu
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.w),  // Esnek padding
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: SizedBox(
                          height: 50.h,  // Esnek buton yüksekliği
                          width: 100.w,  // Esnek buton genişliği
                          child: Padding(
                            padding: EdgeInsets.all(15.w),  // Esnek padding
                            child: Text(
                              settingText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,  // Esnek font boyutu
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
          ],
        ),
      ),
    );
  }
}
