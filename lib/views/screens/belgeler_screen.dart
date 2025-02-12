import 'package:flutter/material.dart';
import 'package:archive_app2/data/services/belges_service.dart';
import 'package:archive_app2/models/belge_model.dart';
import 'package:archive_app2/models/bolum_model.dart';
import 'package:archive_app2/models/archive_model.dart';
import 'package:open_file/open_file.dart'; // Dosyayı açmak için
import 'package:path_provider/path_provider.dart'; // Dosya yolu almak için
import 'package:flutter_screenutil/flutter_screenutil.dart'; // flutter_screenutil paketini ekleyin

class BelgelerScreen extends StatefulWidget {
  const BelgelerScreen({super.key});

  @override
  State<BelgelerScreen> createState() => _BelgelerScreenState();
}

class _BelgelerScreenState extends State<BelgelerScreen> {
  late Future<List<BelgesModel>> belgeList;
  late Bolum bolum;
  late ArchiveModel archiveModel;
  final BelgesService _belgesService = BelgesService();

  @override
  void initState() {
    super.initState();
    belgeList = Future.value([]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map<String, dynamic>) {
      archiveModel = args['archive'];
      if (args['bolum'] != null && args['bolum'] is Bolum) {
        bolum = args['bolum'];
        belgeList = _belgesService.fetchData(archiveModel.id, bolum.id);
      } else if (args['subBolum'] != null && args['subBolum'] is SubBolum) {
        var subBolum = args['subBolum'];
        belgeList = _belgesService.fetchData(archiveModel.id, subBolum.id);
      }
    }
  }

  Future<void> _downloadAndOpenFile(BelgesModel belge) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${belge.fileName}';
      final file = await _belgesService.downloadBelge(belge.id!, filePath);

      // Dosyayı aç
      OpenFile.open(file.path);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dosya açılırken hata oluştu: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belgeler'),
      ),
      body: FutureBuilder<List<BelgesModel>>(
        future: belgeList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('Burada hiç belge yok.'));
          } else {
            var belgeler = snapshot.data!;
            return ListView.builder(
              itemCount: belgeler.length,
              itemBuilder: (context, index) {
                var belge = belgeler[index];
                return ListTile(
                  title: Text(
                    belge.fileName ?? 'Belge Adı Yok',
                    style: TextStyle(fontSize: 16.sp), // Ölçeklendirilmiş font boyutu
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bölüm: ${belge.bolumName ?? 'Bilinmiyor'}',
                        style: TextStyle(fontSize: 14.sp), // Ölçeklendirilmiş font boyutu
                      ),
                      Text(
                        'Boyut: ${belge.size ?? 'Bilinmiyor'} KB',
                        style: TextStyle(fontSize: 14.sp), // Ölçeklendirilmiş font boyutu
                      ),
                      Text(
                        'Yükleme Tarihi: ${belge.uploadDate?.toLocal().toString() ?? 'Bilinmiyor'}',
                        style: TextStyle(fontSize: 14.sp), // Ölçeklendirilmiş font boyutu
                      ),
                    ],
                  ),
                  onTap: () => _downloadAndOpenFile(belge),
                );
              },
            );
          }
        },
      ),
    );
  }
}