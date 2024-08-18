class RequestIccData {
  final String transactionAmount;
  final String anotherAmount;
  final String applicationInterchangeProfile;
  final String applicationTransactionCounter;
  final String authorizationRequest;
  final String cryptogramInfoData;
  final String cardHolderName;
  final String cardHolderVerificationResult;
  final String issuerAppData;
  final String transactionCurrencyCode;
  final String terminalType;
  final String terminalCapabilities;
  final String terminalCountryCode;
  final String terminalVerificationResult;
  final String transactionDate;
  final String transactionType;
  final String unpredictableNumber;
  final String dedicatedFileName;
  final String iccAsString;
  final String appVersionNumber;
  final String interfaceDeviceSerialNumber;
  final String appPanSequenceNumber;

  RequestIccData({
    required this.transactionAmount,
    required this.anotherAmount,
    required this.applicationInterchangeProfile,
    required this.applicationTransactionCounter,
    required this.authorizationRequest,
    required this.cryptogramInfoData,
    required this.cardHolderName,
    required this.cardHolderVerificationResult,
    required this.issuerAppData,
    required this.transactionCurrencyCode,
    required this.terminalType,
    required this.terminalCapabilities,
    required this.terminalCountryCode,
    required this.terminalVerificationResult,
    required this.transactionDate,
    required this.transactionType,
    required this.unpredictableNumber,
    required this.dedicatedFileName,
    required this.iccAsString,
    required this.appVersionNumber,
    required this.interfaceDeviceSerialNumber,
    required this.appPanSequenceNumber,
  });

  // Convert from event (Map) to RequestIccData
  factory RequestIccData.fromMap(Map<String, dynamic> event) {
    return RequestIccData(
      transactionAmount: event['TRANSACTION_AMOUNT'] ?? '',
      anotherAmount: event['ANOTHER_AMOUNT'] ?? '',
      applicationInterchangeProfile: event['APPLICATION_INTERCHANGE_PROFILE'] ?? '',
      applicationTransactionCounter: event['APPLICATION_TRANSACTION_COUNTER'] ?? '',
      authorizationRequest: event['AUTHORIZATION_REQUEST'] ?? '',
      cryptogramInfoData: event['CRYPTOGRAM_INFO_DATA'] ?? '',
      cardHolderName: event['CARD_HOLDER_NAME'] ?? '',
      cardHolderVerificationResult: event['CARD_HOLDER_VERIFICATION_RESULT'] ?? '',
      issuerAppData: event['ISSUER_APP_DATA'] ?? '',
      transactionCurrencyCode: event['TRANSACTION_CURRENCY_CODE'] ?? '',
      terminalType: event['TERMINAL_TYPE'] ?? '',
      terminalCapabilities: event['TERMINAL_CAPABILITIES'] ?? '',
      terminalCountryCode: event['TERMINAL_COUNTRY_CODE'] ?? '',
      terminalVerificationResult: event['TERMINAL_VERIFICATION_RESULT'] ?? '',
      transactionDate: event['TRANSACTION_DATE'] ?? '',
      transactionType: event['TRANSACTION_TYPE'] ?? '',
      unpredictableNumber: event['UNPREDICTABLE_NUMBER'] ?? '',
      dedicatedFileName: event['DEDICATED_FILE_NAME'] ?? '',
      iccAsString: event['ICC_STRING'] ?? '',
      appVersionNumber: event['APP_VERSION_NUMBER'] ?? '',
      interfaceDeviceSerialNumber: event['INTERFACE_DEVICE_SERIAL_NUMBER'] ?? '',
      appPanSequenceNumber: event['APP_PAN_SEQUENCE_NUMBER'] ?? '',
    );
  }

  // Convert RequestIccData to Map (event)
  Map<String, dynamic> toMap() {
    return {
      'TRANSACTION_AMOUNT': transactionAmount,
      'ANOTHER_AMOUNT': anotherAmount,
      'APPLICATION_INTERCHANGE_PROFILE': applicationInterchangeProfile,
      'APPLICATION_TRANSACTION_COUNTER': applicationTransactionCounter,
      'AUTHORIZATION_REQUEST': authorizationRequest,
      'CRYPTOGRAM_INFO_DATA': cryptogramInfoData,
      'CARD_HOLDER_NAME': cardHolderName,
      'CARD_HOLDER_VERIFICATION_RESULT': cardHolderVerificationResult,
      'ISSUER_APP_DATA': issuerAppData,
      'TRANSACTION_CURRENCY_CODE': transactionCurrencyCode,
      'TERMINAL_TYPE': terminalType,
      'TERMINAL_CAPABILITIES': terminalCapabilities,
      'TERMINAL_COUNTRY_CODE': terminalCountryCode,
      'TERMINAL_VERIFICATION_RESULT': terminalVerificationResult,
      'TRANSACTION_DATE': transactionDate,
      'TRANSACTION_TYPE': transactionType,
      'UNPREDICTABLE_NUMBER': unpredictableNumber,
      'DEDICATED_FILE_NAME': dedicatedFileName,
      'ICC_STRING': iccAsString,
      'APP_VERSION_NUMBER': appVersionNumber,
      'INTERFACE_DEVICE_SERIAL_NUMBER': interfaceDeviceSerialNumber,
      'APP_PAN_SEQUENCE_NUMBER': appPanSequenceNumber,
    };
  }
}
