import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../storage/secure_storage.dart';
import 'dio_client.dart';

final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage();
});

final dioProvider = Provider<DioClient>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return DioClient(storage);
});
