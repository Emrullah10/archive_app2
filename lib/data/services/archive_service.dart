import 'dart:convert';
import 'package:archive_app2/data/services/auth_service.dart';
import 'package:archive_app2/models/archive_model.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class ArchiveService {
  final box = GetStorage();

  Future<List<ArchiveModel>> fetchArchive(int pageNumber, int pageSize,
      {String? parsel}) async {
    String? serverUrl = box.read('serverUrl') ?? '';
    final String baseUrl = '$serverUrl/backend/api/archivedocuments';

    String? token = await TokenManager.getToken();
    String url = '$baseUrl?pageNumber=$pageNumber&pageSize=$pageSize';
    
    if (parsel != null && parsel.isNotEmpty) {
      url += '&parsel=$parsel';
    }

    if (token == null) {
      throw Exception('Token bulunamadı');
    }

    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<ArchiveModel> archiveList = [];
      final archiveData = jsonDecode(response.body) as Map<String, dynamic>;
      for (var item in archiveData['data']['data'] as List) {
        archiveList.add(ArchiveModel.fromJson(item));
      }
      return archiveList;
    } else {
      throw Exception('Veri yüklenemedi: ${response.statusCode}');
    }
  }
}
