import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

// Provider to manage the server IP
final serverIpProvider = StateProvider<String?>((ref) {
  final box = GetStorage();
  return box.read('serverUrl');
});
