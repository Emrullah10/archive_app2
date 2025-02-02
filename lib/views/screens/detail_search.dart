import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetayliAramaPage extends StatefulWidget {
  const DetayliAramaPage({Key? key}) : super(key: key);

  @override
  State<DetayliAramaPage> createState() => _DetayliAramaPageState();
}

class _DetayliAramaPageState extends State<DetayliAramaPage> {
  // Tüm alanlar için TextEditingController tanımlayalım
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
              title: const Text("Dosya İşlem No"),
              subtitle: TextField(
                controller: _dosyaIslemNoController,
                decoration: const InputDecoration(
                  hintText: "Dosya İşlem No giriniz",
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
              title: const Text("Adres"),
              subtitle: TextField(
                controller: _adresController,
                decoration: const InputDecoration(
                  hintText: "Adres giriniz",
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
              title: const Text("Özel Şartlar"),
              subtitle: TextField(
                controller: _ozelSartlarController,
                decoration: const InputDecoration(
                  hintText: "Özel Şartlar giriniz",
                ),
              ),
            ),
            // Tasdik Tarihi 1
            ListTile(
              title: const Text("Tasdik Tarihi 1"),
              subtitle: InkWell(
                onTap: () => _pickDate(context, _tasdikTarihi1Controller),
                child: IgnorePointer(
                  child: TextField(
                    controller: _tasdikTarihi1Controller,
                    decoration: const InputDecoration(
                      hintText: "Tasdik Tarihi 1 seçiniz",
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
            ),
            // Tasdik Tarihi 2
            ListTile(
              title: const Text("Tasdik Tarihi 2"),
              subtitle: InkWell(
                onTap: () => _pickDate(context, _tasdikTarihi2Controller),
                child: IgnorePointer(
                  child: TextField(
                    controller: _tasdikTarihi2Controller,
                    decoration: const InputDecoration(
                      hintText: "Tasdik Tarihi 2 seçiniz",
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
            ),
            // Tasdik Tarihi 3
            ListTile(
              title: const Text("Tasdik Tarihi 3"),
              subtitle: InkWell(
                onTap: () => _pickDate(context, _tasdikTarihi3Controller),
                child: IgnorePointer(
                  child: TextField(
                    controller: _tasdikTarihi3Controller,
                    decoration: const InputDecoration(
                      hintText: "Tasdik Tarihi 3 seçiniz",
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
            ),
            // Açıklama
            ListTile(
              title: const Text("Açıklama"),
              subtitle: TextField(
                controller: _aciklamaController,
                decoration: const InputDecoration(
                  hintText: "Açıklama giriniz",
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
            // Yeni
            ListTile(
              title: const Text("Yeni"),
              subtitle: TextField(
                controller: _yeniController,
                decoration: const InputDecoration(
                  hintText: "Yeni giriniz",
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

  /// Tarih seçici (DatePicker)
  Future<void> _pickDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      // Tarihi yyyy-MM-dd formatında yazalım (örn. 2025-01-01)
      final formattedDate = DateFormat("dd-MM-yyyy").format(pickedDate);
      setState(() {
        controller.text = formattedDate;
      });
    }
  }

  /// Arama işlemini yöneten fonksiyon
  void _handleSearch() {
    // Örnek: Controller'daki verileri alıp backend'e gönderin veya filtre uygulayın
    final klasorNo = _klasorNoController.text;
    final konu = _konuController.text;
    final tarih = _tarihController.text;
    // ... vb. diğer alanlar

    debugPrint("Arama yapıldı. KlasörNo: $klasorNo, Konu: $konu, Tarih: $tarih");
    // İstediğiniz backend servisine bu verileri gönderip sonuçları getirebilirsiniz.
  }

  /// Bütün alanları temizler
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
}
