import 'package:archive_app2/data/services/bolum.service.dart';
import 'package:archive_app2/models/archive_model.dart';
import 'package:archive_app2/models/bolum_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // flutter_screenutil ekledim

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<List<Bolum>> bolumList;
  late ArchiveModel archive;
  bool isTile1Expanded = false;
  bool isTile2Expanded = false;
  bool isTile3Expanded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is ArchiveModel) {
      archive = args;
      bolumList = DataService().fetchData(archive.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    const titleText = "Arşiv Detay Sayfası";
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(titleText),
          actions: [
            Image.asset(
              'assets/serdivanminilogo.png',
              width: 50.w, // Esnek logo genişliği
              height: 50.h, // Esnek logo yüksekliği
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Klasör Bilgileri'),
              Tab(text: 'Bölümler'),
            ],
          ),
        ),
        body: TabBarView(children: [
          // İlk sekme: Klasör Bilgileri
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),  // Esnek padding
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(3),
                },
                children: [
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Klasör No:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.klasorNo ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Konu:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.konu ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Tarih:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.tarih ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'SDP:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.sdp ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Konum:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.konum ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Ruhsat No:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.dosyaIslemNo ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Sicil Kodu:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.sicilKodu ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Arşivdeki Yeri:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.arsivdekiYeri ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Mahalle:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.mahalle ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Pafta:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.pafta ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Ada:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.ada ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Parsel:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.parsel ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'İskan Ruhsat:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.adres ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'İmar Plan Adı:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.imarPlaniAdi ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'İsim-Soyisim:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.ozelSartlar ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Yeni Yapı Ruhsat Tarihi:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.tasdikTarihi1 ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Yeni Yapı Ruhsat Tarihi:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.tasdikTarihi1 ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Tadilat Ruhsat Tarihi:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.tasdikTarihi2 ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'İsim Değişikliği Ruhsat Tarihi:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.tasdikTarihi3 ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Yeni Yapı Ruhsat Tarihi:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.tasdikTarihi1 ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Parsel Kodu:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.parselKodu ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'ArşivId:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.arsivId ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Açıklama:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.aciklama ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Yeni  :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.yeni ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: const Text(
                        'Yeni Dosya Yılı:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),  // Esnek padding
                      child: Text(archive.yeniDosyaYili ?? 'Bilinmiyor'),
                    ),
                  ]),
                ],
              ),
            ),
          ),

          // İkinci sekme: Dosyalar
          FutureBuilder<List<Bolum>>(
            future: bolumList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available'));
              } else {
                var bolumler = snapshot.data!;
                return ListView.builder(
                  itemCount: bolumler.length,
                  itemBuilder: (context, index) {
                    var bolum = bolumler[index];
                    return bolum.subBolums.isNotEmpty
                        ? _expansionBolums(bolum)
                        : _listTileSubBolum(context, bolum, archive);
                  },
                );
              }
            },
          ),
        ]),
      ),
    );
  }

  ExpansionTile _expansionBolums(Bolum bolum) {
    return ExpansionTile(
      title: Text(bolum.name),
      children: bolum.subBolums.map((subBolum) {
        return ListTile(
          title: Text(subBolum.name),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/belge',
              arguments: {"subBolum": subBolum, "archive": archive},
            );
          },
        );
      }).toList(),
    );
  }

  ListTile _listTileSubBolum(BuildContext context, Bolum bolum, ArchiveModel archive) {
    return ListTile(
      title: Text(bolum.name),
      onTap: () {
        Navigator.pushNamed(context, '/belge', arguments: {"bolum": bolum, "archive": archive});
      },
    );
  }
}
