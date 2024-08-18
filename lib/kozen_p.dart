

import 'kozen_interface.dart';
import 'kozen_p_platform_interface.dart';

class Kozen_p {
  Future<String?> getPlatformVersion() {
    return Kozen_pPlatform.instance.getPlatformVersion();
  }

  Future<String?> getSampleData() {
    return Kozen_pPlatform.instance.getSampleData();
  }

  Future<String?> initiate() {
    return Kozen_pPlatform.instance.initiateSdk();
  }


  Future<String?> loadDukpt(String ipek, String ksn)  {
    return Kozen_pPlatform.instance.loadDukpt(ipek, ksn);
  }

  Future<String?> loadMasterKey(String masterKey)  {
   return Kozen_pPlatform.instance.loadMasterKey(masterKey);
  }


  Future<String?> loadParamters(String tid, String mid, String terminalCap,
      String countryCode, String merchantAddress, String merchantName) {
    return Kozen_pPlatform.instance.loadParamters(tid, mid, terminalCap, countryCode, merchantAddress, merchantName);
  }

  Future<String?> loadPinKey(String pinKey) {
   return Kozen_pPlatform.instance.loadPinKey(pinKey);
  }

  Future<String?> startTransaction(int amount, bool supportCtlss) {
    return Kozen_pPlatform.instance.startTransaction(amount, supportCtlss);
  }

  void setKozenListener(KozenListener kozenListener) {
    return Kozen_pPlatform.instance.setKozenListener(kozenListener);
  }
}
