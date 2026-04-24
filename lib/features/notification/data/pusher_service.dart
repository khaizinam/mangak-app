import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/storage/secure_storage.dart';

class PusherService {
  late PusherChannelsFlutter pusher;
  final SecureStorage _storage;

  PusherService(this._storage) {
    pusher = PusherChannelsFlutter.getInstance();
  }

  Future<void> init() async {
    try {
      await pusher.init(
        apiKey: ApiConstants.pusherAppKey,
        cluster: ApiConstants.pusherCluster,
        onAuthorizer: (channelName, socketId, options) async {
          final token = await _storage.getAccessToken();
          return {
            "auth": "Bearer $token",
          };
        },
      );
      await pusher.connect();
    } catch (e) {
      print("Pusher Init Error: $e");
    }
  }

  Future<void> subscribeToPublic(String channelName, Function(dynamic) onEvent) async {
    await pusher.subscribe(
      channelName: channelName,
      onEvent: (event) => onEvent(event),
    );
  }

  Future<void> unsubscribe(String channelName) async {
    await pusher.unsubscribe(channelName: channelName);
  }
}
