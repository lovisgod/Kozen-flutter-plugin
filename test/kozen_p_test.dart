import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kozen_p/kozen_interface.dart';
import 'package:kozen_p/kozen_p.dart';
import 'package:kozen_p/kozen_p_platform_interface.dart';
import 'package:kozen_p/kozen_p_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKozen_pPlatform
    with MockPlatformInterfaceMixin
    implements Kozen_pPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getSampleData() => Future.value('Sample Data');

  @override
  Future<String?> initiateSdk() {
    return Future.value("initiate  sdk");
  }

  @override
  Future<String?> loadDukpt(String ipek, String ksn) {
    return Future.value("dukpt key successfully done");
  }

  @override
  Future<String?> loadMasterKey(String masterKey) {
    return Future.value("master key successfully done");
  }

  @override
  Future<String?> loadParamters(
      String tid, String mid,
      String terminalCap, String countryCode,
      String merchantAddress,
      String merchantName
      ) {
    return Future.value("Parameter successfully done");
  }

  @override
  Future<String?> loadPinKey(String pinKey) {
    return Future.value("Pin key successfully done");
  }

  @override
  Future<String?> startTransaction(int amount, bool supportCtlss) {
    return Future.value("Start transaction called");
  }

  @override
  void setKozenListener(KozenListener kozenListener) {
    debugPrint("kozen listener implemented");
  }
}

void main() {
  final Kozen_pPlatform initialPlatform = Kozen_pPlatform.instance;

  test('$MethodChannelKozen_p is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKozen_p>());
  });

  test('getPlatformVersion', () async {
    Kozen_p kozen_pPlugin = Kozen_p();
    MockKozen_pPlatform fakePlatform = MockKozen_pPlatform();
    Kozen_pPlatform.instance = fakePlatform;

    expect(await kozen_pPlugin.getPlatformVersion(), '42');
  });
}
