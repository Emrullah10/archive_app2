import 'dart:convert';
import 'dart:io';
import 'package:archive_app2/data/services/auth_service.dart';
import 'package:archive_app2/models/belge_model.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class BelgesService {
  final box = GetStorage();

  // Belge verilerini çekme fonksiyonu
  Future<List<BelgesModel>> fetchData(int arcid, int bolid) async {
    String? serverUrl = box.read('serverUrl') ?? '';
    final String apiUrl = '$serverUrl/backend/api/belges/archive-document/';

    String? token = await TokenManager.getToken();
    if (token == null) {
      throw Exception('Token bulunamadı');
    }

    final response = await http.get(
      Uri.parse('$apiUrl$arcid/bolum/$bolid'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body); // JSON verisini çözme işlemi
      List<BelgesModel> belgeList = [];
      for (var item in data['data'] as List) {
        belgeList.add(BelgesModel.fromJson(item));
      }
      return belgeList;
    } else {
      throw Exception('Veri yüklenemedi: ${response.statusCode}');
    }
  }

  // Belge indirme fonksiyonu
  Future<File> downloadBelge(int belgeId, String filePath) async {
    String? serverUrl = box.read('serverUrl') ?? '';
    final String downloadUrl = '$serverUrl/backend/api/belges/download/$belgeId';

    String? token = await TokenManager.getToken();
    if (token == null) {
      throw Exception('Token bulunamadı');
    }

    final response = await http.get(
      Uri.parse(downloadUrl),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return file;
    } else {
      throw Exception('Dosya indirilemedi: ${response.statusCode}');
    }
  }
}
