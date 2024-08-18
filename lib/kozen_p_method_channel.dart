import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kozen_p/kozen_events.dart';
import 'package:kozen_p/kozen_interface.dart';
import 'package:kozen_p/requesticcdata.dart';

import 'kozen_p_platform_interface.dart';

/// An implementation of [Kozen_pPlatform] that uses method channels.
class MethodChannelKozen_p extends Kozen_pPlatform {
  late KozenListener _kozenListener;
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('kozen_p');

  @visibleForTesting
  final eventChannel = const EventChannel("kozen_event_p");


  // Stream to listen to events from the native side
   Stream<Map<String, dynamic>> get eventsStream {
    return eventChannel.receiveBroadcastStream().map((event) => Map<String, dynamic>.from(event));
  }

  @override
  void setKozenListener(KozenListener kozenListener) {
    _kozenListener = kozenListener;
    listenToEvents();
  }

  @override
  Future<String?> startTransaction(int amount, bool supportCtlss) async {
    methodChannel.invokeMethod('startTransaction', {
      'amount': amount,
      'withContactless' : supportCtlss
    });
    return "Transaction started";
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getSampleData() async {
    final sampleData = await methodChannel.invokeMethod('getSampleData');
    return sampleData;
  }

  @override
  Future<String?> initiateSdk() async {
    final initiateSdkResponse = await methodChannel.invokeMethod('initiate');
    return initiateSdkResponse;
  }

  @override
  Future<String?> loadDukpt(String ipek, String ksn) async {
    final ret = await methodChannel.invokeMethod("loadDukptKey", {
      'ipek': ipek,
      'ksn': ksn
    });

    return ret;
  }

  @override
  Future<String?> loadMasterKey(String masterKey) async {
    final ret = await methodChannel.invokeMethod("loadMasterKey", {
      'masterKey': masterKey
    });

    return ret;
  }

  @override
  Future<String?> loadParamters(String tid, String mid, String terminalCap,
      String countryCode, String merchantAddress, String merchantName) async {
    final ret = await methodChannel.invokeMethod("loadParameters", {
      'tid': tid,
      'mid': mid,
      'merchantName': merchantName,
      'countryCode': countryCode,
      'merchantAddress': merchantAddress,
      'terminalCapability': terminalCap

    });

    return ret;
  }

  @override
  Future<String?> loadPinKey(String pinKey) async{
    final ret = await methodChannel.invokeMethod("loadPinKey", {
      'pinKey': pinKey
    });

    return ret;
  }

 // LISTEN TO POS EVENTS
  void listenToEvents() {
    eventsStream.listen((event) {
      switch (event['event']) {
        case EventConstant.PRINTING_FAILED:
          print("message: ${event["message"]}");
          _kozenListener.onPrintingFailed(event["code"]);
          break;
        case EventConstant.PRINTING_SUCCEED:
          print("message: ${event["message"]}");
          _kozenListener.onPrintingSucceed();
          break;
        case EventConstant.PRINTING_STARTED:
          print("message : ${event["message"]}");
          _kozenListener.onPrintingStarted();
          break;
        case EventConstant.CARD_DETECTED:
          print("message: ${event["message"]}");
          _kozenListener.onCardDetected(event["isContact"], event["isContactless"]);
          break;
        case EventConstant.INSERT_CARD:
          debugPrint("message: ${event["message"]}");
          _kozenListener.onInsertCard();
          break;
        case EventConstant.CARD_READ:
          debugPrint("message: ${event["message"]}");
          _kozenListener.onCardRead(event["CARD_TYPE"]);
          break;
        case EventConstant.INPUT_PIN:
          debugPrint("message: ${event["message"]}");
          _kozenListener.onInputPin();
          break;
        case EventConstant.TRANSACTION_CANCEL:
          debugPrint("message: ${event["message"]}");
          _kozenListener.onTransactionCancel(event["message"]);
          break;
        case EventConstant.TRANSACTION_CANCEL_BY_USER:
          debugPrint("message: ${event["message"]}");
          _kozenListener.onTransactionCancelByUser(event["message"]);
          break;
        case EventConstant.TRANSACTION_CANCELED_REMOVE_CARD:
          debugPrint("message: ${event["message"]}");
          _kozenListener.onTransactionCanceledRemoveCard(event["message"]);
          break;
        case EventConstant.EMV_PROCESSING:
          debugPrint("message: ${event["message"]}");
          _kozenListener.onEmvProcessing(event["message"]);
          break;
        case EventConstant.EMV_PROCESSED:
          debugPrint("message: ${event["message"]}");
          debugPrint("data: ${event}");
          _kozenListener.onEmvProcessed(RequestIccData.fromMap(event));
          break;
        default:
          print("Unknown event: $event");
      }
    });
  }
}
