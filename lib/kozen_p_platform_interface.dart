import 'package:kozen_p/kozen_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'kozen_p_method_channel.dart';

abstract class Kozen_pPlatform extends PlatformInterface {
  /// Constructs a Kozen_pPlatform.
  Kozen_pPlatform() : super(token: _token);

  static final Object _token = Object();

  static Kozen_pPlatform _instance = MethodChannelKozen_p();

  /// The default instance of [Kozen_pPlatform] to use.
  ///
  /// Defaults to [MethodChannelKozen_p].
  static Kozen_pPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Kozen_pPlatform] when
  /// they register themselves.
  static set instance(Kozen_pPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getSampleData() {
    throw UnimplementedError('This is not implemented');
  }

  Future<String?> initiateSdk() {
    throw UnimplementedError('This is not implemented');
  }

  Future<String?> loadParamters(
      String tid, String mid,
      String terminalCap, String countryCode,
      String merchantAddress, String merchantName
      ) {
    throw UnimplementedError('This is not implemented');
  }

  Future<String?> loadPinKey(String pinKey) {
    throw UnimplementedError('This is not implemented');
  }

  Future<String?> loadMasterKey(String masterKey) {
    throw UnimplementedError('This is not implemented');
  }

  Future<String?> loadDukpt(String ipek, String ksn) {
    throw UnimplementedError('This is not implemented');
  }

  Future<String?> startTransaction(int amount, bool supportCtlss) {
    throw UnimplementedError("this is not implemented");
  }

  void setKozenListener(KozenListener kozenListener) {
    throw UnimplementedError("this is not implemented");
  }
}
