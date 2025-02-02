
import 'package:archive_app2/data/services/bolum.service.dart';
import 'package:archive_app2/models/archive_model.dart';
import 'package:archive_app2/models/bolum_model.dart';
import 'package:flutter/material.dart';


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

    // context ile bağımlı işlemleri burada yapın
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
            Image.asset('assets/serdivanminilogo.png', width: 50, height: 50),
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
              padding: const EdgeInsets.all(16.0),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(3),
                },
                children: [
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Klasör No:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.klasorNo ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Konu:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.konu ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Tarih:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.tarih ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'SDP:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.sdp ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Konum:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.konum ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Ruhsat No:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.dosyaIslemNo ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Sicil Kodu:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.sicilKodu ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Arşivdeki Yeri:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.arsivdekiYeri ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Mahalle:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.mahalle ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Pafta:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.pafta ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Ada:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.ada ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Parsel:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.parsel ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'İskan Ruhsat:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.adres ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'İmar Plan Adı:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.imarPlaniAdi ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'İsim-Soyisim:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.ozelSartlar ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Yeni Yapı Ruhsat Tarihi:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.tasdikTarihi1 ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Yeni Yapı Ruhsat Tarihi:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.tasdikTarihi1 ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Tadilat Ruhsat Tarihi:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.tasdikTarihi2?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'İsim Değişikliği Ruhsat Tarihi:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.tasdikTarihi3 ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Yeni Yapı Ruhsat Tarihi:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.tasdikTarihi1 ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Parsel Kodu:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.parselKodu ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'ArşivId:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(archive.arsivId ?? 'Bilinmiyor'),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Yeni Dosya Yılı:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                    return bolum.subBolums.isNotEmpty ? _expansionBolums(bolum):_listTileSubBolum(context,bolum,archive);
                  },
                );
              }
            },
          ),
          // ListView(
          //   children: <Widget>[
          //     ExpansionTile(
          //       initiallyExpanded: isTile1Expanded,
          //       onExpansionChanged: (bool expanded) {
          //         setState(() {
          //           isTile1Expanded = expanded;
          //         });
          //       },
          //       title: const Text('Dosya 1'),
          //       children: <Widget>[
          //         ExpansionTile(
          //           initiallyExpanded: isTile2Expanded,
          //           onExpansionChanged: (bool expanded) {
          //             setState(() {
          //               isTile2Expanded = expanded;
          //             });
          //           },
          //           tilePadding: const EdgeInsets.only(left: 40.0),
          //           title: const Text('Bölüm 1'),
          //           children: <Widget>[
          //             ListTile(
          //               contentPadding: const EdgeInsets.only(left: 80.0),
          //               title: const Text('Bölüm 1 PDF 1'),
          //               onTap: () async {
          //                 // PDF'yi açma işlemi
          //                 String path = await _copyAssetToLocalStorage(
          //                     'assets/harita.pdf');
          //                 if (path.isNotEmpty) {
          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                       builder: (context) =>
          //                           PDFViewerPage(filePath: path),
          //                     ),
          //                   );
          //                 } else {
          //                   // Hata yönetimi, örneğin bir uyarı gösterin
          //                 }
          //               },
          //             ),
          //             ListTile(
          //               contentPadding: const EdgeInsets.only(left: 80.0),
          //               title: const Text('Bölüm 1 PDF 2'),
          //               onTap: () async {
          //                 String path = await _copyAssetToLocalStorage(
          //                     'assets/dosya.pdf');
          //                 if (path.isNotEmpty) {
          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                       builder: (context) =>
          //                           PDFViewerPage(filePath: path),
          //                     ),
          //                   );
          //                 } else {
          //                   // Hata yönetimi, örneğin bir uyarı gösterin
          //                 }
          //               },
          //             ),
          //           ],
          //         ),
          //         ExpansionTile(
          //           tilePadding: const EdgeInsets.only(left: 40.0),
          //           title: const Text('Bölüm 2'),
          //           children: <Widget>[
          //             ListTile(
          //               contentPadding: const EdgeInsets.only(left: 80.0),
          //               title: const Text('Bölüm 2 PDF 1'),
          //               onTap: () async {
          //                 String path = await _copyAssetToLocalStorage(
          //                     'assets/serdivanparkuru.pdf');
          //                 if (path.isNotEmpty) {
          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                       builder: (context) =>
          //                           PDFViewerPage(filePath: path),
          //                     ),
          //                   );
          //                 } else {
          //                   // Hata yönetimi, örneğin bir uyarı gösterin
          //                 }
          //               },
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
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
                         Navigator.pushNamed(context, '/belge', arguments:{"subBolum":subBolum,"archive":archive},);
                        },
                      );
                    }).toList(),
                  );
  }
}

ListTile _listTileSubBolum(context,Bolum bolum,ArchiveModel archive) {
  return ListTile(
    title: Text(bolum.name),
    onTap: () {
      Navigator.pushNamed(context, '/belge', arguments:{"bolum":bolum,"archive":archive}  );
    },
  );
}

