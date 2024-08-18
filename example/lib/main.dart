import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:kozen_p/kozen_interface.dart';
import 'package:kozen_p/kozen_p.dart';
import 'package:kozen_p/requesticcdata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _sampleData = "Sample data";
  final _kozen_pPlugin = Kozen_p();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    getSampleData();
    initiateSdk();
    setListener();
  }


  void setListener(){
    _kozen_pPlugin.setKozenListener(SampleKozenListener());
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _kozen_pPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  void startTransaction() async {
    String? ret = await _kozen_pPlugin.startTransaction(100, true);
    debugPrint(ret);
  }

  Future<void> getSampleData() async {
    String sampleData;
    try {
      sampleData  = await _kozen_pPlugin.getSampleData() ?? "Sample data did not come back";
    } on Exception {
      sampleData = 'An issue occurred fetching sample data';
    }

    setState(() {
      _sampleData = sampleData;
    });
  }

  Future<void> initiateSdk() async {
    String? initiationResponse = await _kozen_pPlugin.initiate();
    debugPrint(initiationResponse);
  }

  Future<void> loadPinKey() async {
    String? ret = await _kozen_pPlugin.loadPinKey("F2B580B6D0CEBA9316A849F4B5F49115");
    debugPrint(ret);
  }

  Future<void> loadMasterKey() async {
    String? ret = await _kozen_pPlugin.loadMasterKey("8FE96E91A77C16EWD95B5804FDADFDF4");
    debugPrint(ret);
  }

  Future<void> loadDukpt() async {
    String? ret = await _kozen_pPlugin.loadDukpt("", "");
    debugPrint(ret);
  }

  Future<void> loadParamaters() async {
    String? ret = await _kozen_pPlugin.loadParamters(
        "2ISW0001",
        "2ISW1234567TEST",
        "E0F8C8", "0566", "merchantAddress", "merchantName");
    debugPrint(ret);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              Text('SD: $_sampleData\n'),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  initiateSdk();
                },
                child: Text('Test initiates'),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  loadPinKey();
                },
                child: Text('Test Pin Key Injection'),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  loadParamaters();
                },
                child: Text('Test load parameter'),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  loadDukpt();
                },
                child: Text('Test load dukpt'),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  loadMasterKey();
                },
                child: Text('Test load master key'),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  startTransaction();
                },
                child: Text('Start Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class SampleKozenListener extends KozenListener {
  @override
  void onCardDetected(bool isContact, bool isContactless) {
     debugPrint("is contact :::: $isContact");
     debugPrint("is contactless :::: $isContactless");
  }

  @override
  void onCardRead(String cardType) {
    debugPrint("Card Type :::: $cardType");
  }

  @override
  void onEmvProcessed(RequestIccData requestIccData) {
    debugPrint("icc data :::: ${requestIccData.toMap()}");
  }

  @override
  void onEmvProcessing(String message) {
    debugPrint("$message");
  }

  @override
  void onInputPin() {
    debugPrint("input pin");
  }

  @override
  void onInsertCard() {
    debugPrint("insert customer card");
  }

  @override
  void onPrintingFailed(String code) {
    debugPrint("print failed code is :::: $code");
  }

  @override
  void onPrintingStarted() {
    debugPrint("Printing started");
  }

  @override
  void onPrintingSucceed() {
    debugPrint("Printing succeed");
  }

  @override
  void onTransactionCancel(String message) {
    debugPrint("transaction canceled :::: message is $message");
  }

  @override
  void onTransactionCancelByUser(String message) {
    debugPrint("transaction canceled by user:::: message is $message");
  }

  @override
  void onTransactionCanceledRemoveCard(String message) {
    debugPrint("transaction canceled .... remove user card ::: message is $message");
  }

}
