import 'package:kozen_p/requesticcdata.dart';

abstract class KozenListener {
  void onPrintingFailed(String code);
  void onTransactionCancel(String message);
  void onTransactionCancelByUser(String message);
  void onPrintingSucceed();
  void onPrintingStarted();
  void onTransactionCanceledRemoveCard(String message);
  void onInputPin();
  void onInsertCard();
  void onCardDetected(bool isContact, bool isContactless);
  void onCardRead(String cardType);
  void onEmvProcessed(RequestIccData requestIccData);
  void onEmvProcessing(String message);
}
