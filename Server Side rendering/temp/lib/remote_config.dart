import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigclass {
  final remoteConfig = FirebaseRemoteConfig.instance;

  Future initializeConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 2),
      minimumFetchInterval: const Duration(seconds: 2),
    ));
    await remoteConfig.fetchAndActivate();
    var data = remoteConfig.getString('DynamicWidget');
    print(data);
    return data;
  }
}
