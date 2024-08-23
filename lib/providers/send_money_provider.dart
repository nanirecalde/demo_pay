// providers/send_money_provider.dart
import 'package:flutter/material.dart';

class SendMoneyProvider with ChangeNotifier {
  String _contactName = '';
  String _contactAccount = '';
  String _contactAvatar = '';
  String _amountString = '0';

  String get contactName => _contactName;
  String get contactAccount => _contactAccount;
  String get contactAvatar => _contactAvatar;
  String get amountString => _amountString;

  double get amount => double.tryParse(_amountString) ?? 0.0;

  void setContactDetails(String name, String account, String avatar) {
    _contactName = name;
    _contactAccount = account;
    _contactAvatar = avatar;
    notifyListeners();
  }

  void addDigit(String digit) {
    if (_amountString == '0') {
      _amountString = digit;
    } else {
      _amountString += digit;
    }
    notifyListeners();
  }

  void addDecimal() {
    if (!_amountString.contains('.')) {
      _amountString += '.';
    }
    notifyListeners();
  }

  void deleteLastDigit() {
    if (_amountString.isNotEmpty) {
      _amountString = _amountString.substring(0, _amountString.length - 1);
      if (_amountString.isEmpty || _amountString == '0') {
        _amountString = '0';
      }
    }
    notifyListeners();
  }

  void reset() {
    _contactName = '';
    _contactAccount = '';
    _contactAvatar = '';
    _amountString = '0';
    notifyListeners();
  }
}
