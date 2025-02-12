import 'package:archive_app2/views/widgets/custom_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:archive_app2/data/services/archive_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetayliAramaPage extends StatefulWidget {
  const DetayliAramaPage({super.key});

  @override
  State<DetayliAramaPage> createState() => _DetayliAramaPageState();
}

class _DetayliAramaPageState extends State<DetayliAramaPage> {
  final TextEditingController _klasorNoController = TextEditingController();
  final TextEditingController _konuController = TextEditingController();
  final TextEditingController _tarihController = TextEditingController();
  final TextEditingController _sdpController = TextEditingController();
  final TextEditingController _konumController = TextEditingController();
  final TextEditingController _dosyaIslemNoController = TextEditingController();
  final TextEditingController _sicilKoduController = TextEditingController();
  final TextEditingController _arsivdekiYeriController = TextEditingController();
  final TextEditingController _paftaController = TextEditingController();
  final TextEditingController _adaController = TextEditingController();
  final TextEditingController _parselController = TextEditingController();
  final TextEditingController _adresController = TextEditingController();
  final TextEditingController _imarPlaniAdiController = TextEditingController();
  final TextEditingController _ozelSartlarController = TextEditingController();
  final TextEditingController _tasdikTarihi1Controller = TextEditingController();
  final TextEditingController _tasdikTarihi2Controller = TextEditingController();
  final TextEditingController _tasdikTarihi3Controller = TextEditingController();
  final TextEditingController _aciklamaController = TextEditingController();
  final TextEditingController _parselKoduController = TextEditingController();
  final TextEditingController _arsivIdController = TextEditingController();
  final TextEditingController _yeniController = TextEditingController();
  final TextEditingController _yeniDosyaYiliController = TextEditingController();

  final ArchiveService _archiveService = ArchiveService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detaylı Arama"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          children: [
            // Klasör No
            ListTile(
              title: const Text("Klasör No"),
              subtitle: TextField(
                controller: _klasorNoController,
                decoration: InputDecoration(
                  hintText: "Klasör No giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Konu
            ListTile(
              title: const Text("Konu"),
              subtitle: TextField(
                controller: _konuController,
                decoration: InputDecoration(
                  hintText: "Konu giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Tarih (DatePicker)
            ListTile(
              title: const Text("Tarih"),
              subtitle: InkWell(
                onTap: () => _pickDate(context, _tarihController),
                child: IgnorePointer(
                  child: TextField(
                    controller: _tarihController,
                    decoration: InputDecoration(
                      hintText: "Tarih seçiniz",
                      suffixIcon: const Icon(Icons.calendar_today),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                    ),
                  ),
                ),
              ),
            ),
            // SDP
            ListTile(
              title: const Text("SDP"),
              subtitle: TextField(
                controller: _sdpController,
                decoration: InputDecoration(
                  hintText: "SDP giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Konum
            ListTile(
              title: const Text("Konum"),
              subtitle: TextField(
                controller: _konumController,
                decoration: InputDecoration(
                  hintText: "Konum giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Dosya İşlem No (Ruhsat No)
            ListTile(
              title: const Text("Ruhtas No"),
              subtitle: TextField(
                controller: _dosyaIslemNoController,
                decoration: InputDecoration(
                  hintText: "Ruhsat No giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Sicil Kodu
            ListTile(
              title: const Text("Sicil Kodu"),
              subtitle: TextField(
                controller: _sicilKoduController,
                decoration: InputDecoration(
                  hintText: "Sicil Kodu giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Arşivdeki Yeri
            ListTile(
              title: const Text("Arşivdeki Yeri"),
              subtitle: TextField(
                controller: _arsivdekiYeriController,
                decoration: InputDecoration(
                  hintText: "Arşivdeki Yeri giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Pafta
            ListTile(
              title: const Text("Pafta"),
              subtitle: TextField(
                controller: _paftaController,
                decoration: InputDecoration(
                  hintText: "Pafta giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Ada
            ListTile(
              title: const Text("Ada"),
              subtitle: TextField(
                controller: _adaController,
                decoration: InputDecoration(
                  hintText: "Ada giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Parsel
            ListTile(
              title: const Text("Parsel"),
              subtitle: TextField(
                controller: _parselController,
                decoration: InputDecoration(
                  hintText: "Parsel giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // İskan Ruhsat (Adres)
            ListTile(
              title: const Text("İskan Ruhsat"),
              subtitle: TextField(
                controller: _adresController,
                decoration: InputDecoration(
                  hintText: "İskan Ruhsat giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // İmar Planı Adı
            ListTile(
              title: const Text("İmar Planı Adı"),
              subtitle: TextField(
                controller: _imarPlaniAdiController,
                decoration: InputDecoration(
                  hintText: "İmar Planı Adı giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Ruhsat Sahibi (Özel Şartlar)
            ListTile(
              title: const Text("Ruhsat Sahibi(İsim-Soyisim)"),
              subtitle: TextField(
                controller: _ozelSartlarController,
                decoration: InputDecoration(
                  hintText: "Ruhsat Sahibi(İsim-Soyisim) giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Yeni Yapı Ruhsat Tarihi
            ListTile(
              title: const Text("Yeni Yapı Ruhsat Tarihi"),
              subtitle: InkWell(
                onTap: () => _pickDate(context, _tasdikTarihi1Controller),
                child: IgnorePointer(
                  child: TextField(
                    controller: _tasdikTarihi1Controller,
                    decoration: InputDecoration(
                      hintText: "Yeni Yapı Ruhsat Tarihi",
                      suffixIcon: const Icon(Icons.calendar_today),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                    ),
                  ),
                ),
              ),
            ),
            // Tadilat Ruhsat Sahibi
            ListTile(
              title: const Text("Tadilat Ruhsat Sahibi"),
              subtitle: InkWell(
                onTap: () => _pickDate(context, _tasdikTarihi2Controller),
                child: IgnorePointer(
                  child: TextField(
                    controller: _tasdikTarihi2Controller,
                    decoration: InputDecoration(
                      hintText: "Tadilat Ruhsat Sahibi",
                      suffixIcon: const Icon(Icons.calendar_today),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                    ),
                  ),
                ),
              ),
            ),
            // İsim Değişikliği Ruhsat Tarihi
            ListTile(
              title: const Text("İsim Değişikliği Ruhsat Tarihi"),
              subtitle: InkWell(
                onTap: () => _pickDate(context, _tasdikTarihi3Controller),
                child: IgnorePointer(
                  child: TextField(
                    controller: _tasdikTarihi3Controller,
                    decoration: InputDecoration(
                      hintText: "İsim Değişikliği Ruhsat Tarihi",
                      suffixIcon: const Icon(Icons.calendar_today),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                    ),
                  ),
                ),
              ),
            ),
            // Parsel Kodu
            ListTile(
              title: const Text("Parsel Kodu"),
              subtitle: TextField(
                controller: _parselKoduController,
                decoration: InputDecoration(
                  hintText: "Parsel Kodu giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Arşiv Id
            ListTile(
              title: const Text("Arşiv Id"),
              subtitle: TextField(
                controller: _arsivIdController,
                decoration: InputDecoration(
                  hintText: "Arşiv Id giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            // Yeni Dosya Yılı
            ListTile(
              title: const Text("Yeni Dosya Yılı"),
              subtitle: TextField(
                controller: _yeniDosyaYiliController,
                decoration: InputDecoration(
                  hintText: "Yeni Dosya Yılı giriniz",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // "Ara" ve "Temizle" butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _handleSearch,
                  child: const Text("Ara"),
                ),
                ElevatedButton(
                  onPressed: _clearAllFields,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: const Text("Temizle"),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      final formattedDate = DateFormat("dd-MM-yyyy").format(pickedDate);
      setState(() {
        controller.text = formattedDate;
      });
    }
  }

  void _handleSearch() async {
  final klasorNo = _klasorNoController.text;
  final konu = _konuController.text;
  final tarih = _tarihController.text;
  final parsel = _parselController.text;
  final dosyaIslemNoo = _dosyaIslemNoController.text;
  final sdpp = _sdpController.text;
  final konumm = _konumController.text;
  final sicilKoduu = _sicilKoduController.text;
  final arsivdekiYerii = _arsivdekiYeriController.text;
  final paftaa = _paftaController.text;
  final adaa = _adaController.text;
  final adres = _adresController.text;
  final imarPlaniAdii = _imarPlaniAdiController.text;
  final ozelSartlar = _ozelSartlarController.text;
  final tasdikTarihi1 = _tasdikTarihi1Controller.text;
  final tasdikTarihi2 = _tasdikTarihi2Controller.text;
  final tasdikTarihi3 = _tasdikTarihi3Controller.text;
  final parselKodu = _parselKoduController.text;
  final arsivId = _arsivIdController.text;
  final yeniDosyaYili = _yeniDosyaYiliController.text;

  try {
    final archiveList = await _archiveService.fetchArchive(
      1,
      10,
      parsel: parsel,
      klasorNo: klasorNo,
      konu: konu,
      tarih: tarih,
      dosyaIslemNo: dosyaIslemNoo,
      sdp: sdpp,
      konum: konumm,
      sicilKodu: sicilKoduu,
      arsivdekiYeri: arsivdekiYerii,
      pafta: paftaa,
      ada: adaa,
      adres: adres,
      imarPlaniAdi: imarPlaniAdii,
      ozelSartlar: ozelSartlar,
      tasdikTarihi1: tasdikTarihi1,
      tasdikTarihi2: tasdikTarihi2,
      tasdikTarihi3: tasdikTarihi3,
      parselKodu: parselKodu,
      arsivId: arsivId,
      yeniDosyaYili: yeniDosyaYili,
    );

    if (archiveList.isNotEmpty) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SizedBox(
            height: 0.8.sh,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Text(
                    "Arama Sonuçları (${archiveList.length})",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: archiveList.length,
                    itemBuilder: (context, index) {
                      final archiveItem = archiveList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: CustomListTile(
                          folderNo: archiveItem.klasorNo ?? "",
                          folderDate: archiveItem.tarih ?? "",
                          islem: archiveItem.dosyaIslemNo ?? "",
                          foldermean: archiveItem.konum ?? "",
                          parsel: archiveItem.parsel ?? "",
                          icon: Icons.folder,
                          onTap: () {
                            Navigator.pop(context); // Bottom sheet kapansın
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: archiveItem,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      _showErrorDialog('Arama sonuçları bulunamadı');
    }
  } catch (e) {
    _showErrorDialog('Arama sırasında bir hata oluştu: $e');
  }
}


  void _clearAllFields() {
    setState(() {
      _klasorNoController.clear();
      _konuController.clear();
      _tarihController.clear();
      _sdpController.clear();
      _konumController.clear();
      _dosyaIslemNoController.clear();
      _sicilKoduController.clear();
      _arsivdekiYeriController.clear();
      _paftaController.clear();
      _adaController.clear();
      _parselController.clear();
      _adresController.clear();
      _imarPlaniAdiController.clear();
      _ozelSartlarController.clear();
      _tasdikTarihi1Controller.clear();
      _tasdikTarihi2Controller.clear();
      _tasdikTarihi3Controller.clear();
      _aciklamaController.clear();
      _parselKoduController.clear();
      _arsivIdController.clear();
      _yeniController.clear();
      _yeniDosyaYiliController.clear();
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hata'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Kapat'),
          ),
        ],
      ),
    );
  }
}
