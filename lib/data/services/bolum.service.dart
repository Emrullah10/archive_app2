import 'dart:convert';
import 'package:archive_app2/data/services/archive_service.dart';
import 'package:archive_app2/data/services/auth_service.dart';
import 'package:archive_app2/models/bolum_model.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class DataService {
  ArchiveService archiveService = ArchiveService();
  final box = GetStorage();

  Future<List<Bolum>> fetchData(int id) async {
    String? serverUrl = box.read('serverUrl') ?? '';
    final String apiUrl = '$serverUrl/backend/api/bolums/archive-document/';

    String? token = await TokenManager.getToken();
    if (token == null) {
      throw Exception('Token bulunamadı');
    }

    final response = await http.get(
      Uri.parse('$apiUrl$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body); // JSON verisini çözme işlemi
      List<Bolum> bolumList = [];
      for (var item in data['data'] as List) {
        bolumList.add(Bolum.fromJson(item));
      }
      return bolumList;
    } else {
      throw Exception('Veri yüklenemedi: ${response.statusCode}');
    }
  }
}
