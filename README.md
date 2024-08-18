# KOZEN FLUTTER PLUGIN

 ## Overview

The kozen_p plugin is designed to facilitate interaction with specific payment processing features in Android via Flutter. This plugin provides methods to initiate transactions, load various keys (e.g., PIN key, master key), and interact with the EMV (Europay, MasterCard, and Visa) transaction flow. It also supports listening to various transaction events using a custom listener.

## INSTALLATION

To include the kozen_p plugin in your Flutter project, add the following dependency to your pubspec.yaml file:

 ```yaml
 dependencies:
  kozen_p:
 ```
## USAGE

### Import the Plugin

```dart
import 'package:kozen_p/kozen_p.dart';
```

### Initialize the Plugin

Before using the plugin, ensure you initialize it and set up the necessary listeners for transaction events.

```dart
final _kozen_pPlugin = Kozen_p();

@override
void initState() {
  super.initState();
  initiateSdk();
  setListener();
}

```
#### Before any transaction or key loading, initialize the SDK:

```dart
Future<void> initiateSdk() async {
  String? initiationResponse = await _kozen_pPlugin.initiate();
  debugPrint(initiationResponse);
}

```

### Set a listener

To receive callbacks from the plugin during a transaction, set a listener that implements the KozenListener interface.

```dart
void setListener() {
  _kozen_pPlugin.setKozenListener(SampleKozenListener());
}

class SampleKozenListener extends KozenListener {
  @override
  void onCardDetected(bool isContact, bool isContactless) {
    debugPrint("is contact :::: $isContact");
    debugPrint("is contactless :::: $isContactless");
  }

  // Implement other callback methods...
}

```

### Loading keys

The plugin provides methods to load different keys required for secure transactions.

### Loading Pin Key

```dart
Future<void> loadPinKey() async {
  String? ret = await _kozen_pPlugin.loadPinKey("F2B580B6D0CEBA9316A849F4B5F49115");
  debugPrint(ret);
}
```
### Loading master key

```dart
Future<void> loadMasterKey() async {
  String? ret = await _kozen_pPlugin.loadMasterKey("8FE96E91A77C16EWD95B5804FDADFDF4");
  debugPrint(ret);
}
```

### Load DUKPT

```dart
Future<void> loadDukpt() async {
  String? ret = await _kozen_pPlugin.loadDukpt("", "");
  debugPrint(ret);
}

```

### Loading Parameters

To load transaction parameters such as terminal ID, merchant ID, and others:

```dart
Future<void> loadParameters() async {
  String? ret = await _kozen_pPlugin.loadParameters(
      "2ISW0001",
      "2ISW1234567TEST",
      "E0F8C8", "0566", "merchantAddress", "merchantName");
  debugPrint(ret);
}

```

### Start a transaction

To initiate a transaction, call the startTransaction method:

```dart
void startTransaction() async {
  String? ret = await _kozen_pPlugin.startTransaction(100, true);
  debugPrint(ret);
}

```

## Example App

Below is a simple Flutter app demonstrating the use of the kozen_p plugin:

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _kozen_pPlugin = Kozen_p();

  @override
  void initState() {
    super.initState();
    initiateSdk();
    setListener();
  }

  void setListener(){
    _kozen_pPlugin.setKozenListener(SampleKozenListener());
  }

  Future<void> initiateSdk() async {
    String? initiationResponse = await _kozen_pPlugin.initiate();
    debugPrint(initiationResponse);
  }

  void startTransaction() async {
    String? ret = await _kozen_pPlugin.startTransaction(100, true);
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
  }

  // Implement other callback methods...
}

```
