import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:archive_app2/data/services/archive_service.dart';
import 'package:archive_app2/models/archive_model.dart';

class DetayliAramaPage extends StatefulWidget {
  const DetayliAramaPage({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            // Klasör No
            ListTile(
              title: const Text("Klasör No"),
              subtitle: TextField(
                controller: _klasorNoController,
                decoration: const InputDecoration(
                  hintText: "Klasör No giriniz",
                ),
              ),
            ),
            // Konu
            ListTile(
              title: const Text("Konu"),
              subtitle: TextField(
                controller: _konuController,
                decoration: const InputDecoration(
                  hintText: "Konu giriniz",
                ),
              ),
            ),
            // Tarih (DatePicker)
            ListTile(
              title: const Text("Tarih"),
              subtitle: InkWell(
                onTap: () => _pickDate(context, _tarihController),
                // TextField dokunulmaz olsun ki sadece takvim açalım
                child: IgnorePointer(
                  child: TextField(
                    controller: _tarihController,
                    decoration: const InputDecoration(
                      hintText: "Tarih seçiniz",
                      suffixIcon: Icon(Icons.calendar_today),
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
                decoration: const InputDecoration(
                  hintText: "SDP giriniz",
                ),
              ),
            ),
            // Konum
            ListTile(
              title: const Text("Konum"),
              subtitle: TextField(
                controller: _konumController,
                decoration: const InputDecoration(
                  hintText: "Konum giriniz",
                ),
              ),
            ),
            // Dosya İşlem No
            ListTile(
              title: const Text("Ruhtas No"),
              subtitle: TextField(
                controller: _dosyaIslemNoController,
                decoration: const InputDecoration(
                  hintText: "Ruhsat No giriniz",
                ),
              ),
            ),
            // Sicil Kodu
            ListTile(
              title: const Text("Sicil Kodu"),
              subtitle: TextField(
                controller: _sicilKoduController,
                decoration: const InputDecoration(
                  hintText: "Sicil Kodu giriniz",
                ),
              ),
            ),
            // Arşivdeki Yeri
            ListTile(
              title: const Text("Arşivdeki Yeri"),
              subtitle: TextField(
                controller: _arsivdekiYeriController,
                decoration: const InputDecoration(
                  hintText: "Arşivdeki Yeri giriniz",
                ),
              ),
            ),
            // Pafta
            ListTile(
              title: const Text("Pafta"),
              subtitle: TextField(
                controller: _paftaController,
                decoration: const InputDecoration(
                  hintText: "Pafta giriniz",
                ),
              ),
            ),
            // Ada
            ListTile(
              title: const Text("Ada"),
              subtitle: TextField(
                controller: _adaController,
                decoration: const InputDecoration(
                  hintText: "Ada giriniz",
                ),
              ),
            ),
            // Parsel
            ListTile(
              title: const Text("Parsel"),
              subtitle: TextField(
                controller: _parselController,
                decoration: const InputDecoration(
                  hintText: "Parsel giriniz",
                ),
              ),
            ),
            // Adres
            ListTile(
              title: const Text("İskan Ruhsat"),
              subtitle: TextField(
                controller: _adresController,
                decoration: const InputDecoration(
                  hintText: "İskan Ruhsat giriniz",
                ),
              ),
            ),
            // İmar Planı Adı
            ListTile(
              title: const Text("İmar Planı Adı"),
              subtitle: TextField(
                controller: _imarPlaniAdiController,
                decoration: const InputDecoration(
                  hintText: "İmar Planı Adı giriniz",
                ),
              ),
            ),
            // Özel Şartlar
            ListTile(
              title: const Text("Ruhsat Sahibi(İsim-Soyisim)"),
              subtitle: TextField(
                controller: _ozelSartlarController,
                decoration: const InputDecoration(
                  hintText: "Ruhsat Sahibi(İsim-Soyisim) giriniz",
                ),
              ),
            ),
            // Tasdik Tarihi 1
            ListTile(
              title: const Text("Yeni Yapı Ruhsat Tarihi"),
              subtitle: InkWell(
                onTap: () => _pickDate(context, _tasdikTarihi1Controller),
                child: IgnorePointer(
                  child: TextField(
                    controller: _tasdikTarihi1Controller,
                    decoration: const InputDecoration(
                      hintText: "Yeni Yapı Ruhsat Tarihi",
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
            ),
            // Tasdik Tarihi 2
            ListTile(
              title: const Text("Tadilat Ruhsat Sahibi"),
              subtitle: InkWell(
                onTap: () => _pickDate(context, _tasdikTarihi2Controller),
                child: IgnorePointer(
                  child: TextField(
                    controller: _tasdikTarihi2Controller,
                    decoration: const InputDecoration(
                      hintText: "Tadilat Ruhsat Sahibi",
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
            ),
            // Tasdik Tarihi 3
            ListTile(
              title: const Text("İsim Değişikliği Ruhsat Tarihi"),
              subtitle: InkWell(
                onTap: () => _pickDate(context, _tasdikTarihi3Controller),
                child: IgnorePointer(
                  child: TextField(
                    controller: _tasdikTarihi3Controller,
                    decoration: const InputDecoration(
                      hintText: "İsim Değişikliği Ruhsat Tarihi",
                      suffixIcon: Icon(Icons.calendar_today),
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
                decoration: const InputDecoration(
                  hintText: "Parsel Kodu giriniz",
                ),
              ),
            ),
            // Arşiv Id
            ListTile(
              title: const Text("Arşiv Id"),
              subtitle: TextField(
                controller: _arsivIdController,
                decoration: const InputDecoration(
                  hintText: "Arşiv Id giriniz",
                ),
              ),
            ),
    
           
            // Yeni Dosya Yılı
            ListTile(
              title: const Text("Yeni Dosya Yılı"),
              subtitle: TextField(
                controller: _yeniDosyaYiliController,
                decoration: const InputDecoration(
                  hintText: "Yeni Dosya Yılı giriniz",
                ),
              ),
            ),

            const SizedBox(height: 16),

            // "Ara" ve "Temizle" butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Tüm controller verilerini toplayıp arama işlemini başlatabilirsiniz
                    _handleSearch();
                  },
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
    final dosyaIslemNoo= _dosyaIslemNoController.text;
    final sdpp=_sdpController.text;
    final konumm=_konumController.text;
    final sicilKoduu=_sicilKoduController.text;
    final arsivdekiYerii=_arsivdekiYeriController.text;
    final paftaa=_paftaController.text;
    final adaa=_adaController.text;
    final adres=_adresController.text;
    final imarPlaniAdii=_imarPlaniAdiController.text;
    final ozelSartlar=_ozelSartlarController.text;
    final tasdikTarihi1=_tasdikTarihi1Controller.text;
    final tasdikTarihi2=_tasdikTarihi2Controller.text;
    final tasdikTarihi3=_tasdikTarihi3Controller.text;
    final parselKodu=_parselKoduController.text;
    final arsivId=_arsivIdController.text;
    final yeniDosyaYili=_yeniDosyaYiliController.text;

    try {
      final archiveList = await _archiveService.fetchArchive(1, 10, 
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
        Navigator.pushNamed(
          context,
          '/detail', 
          arguments: archiveList.first,  // İlk sonucu detay sayfasına gönderiyoruz
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
