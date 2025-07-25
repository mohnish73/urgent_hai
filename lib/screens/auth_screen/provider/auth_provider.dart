import 'dart:async';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  final int _defaultOtpDuration = 30; // 🔁 Change this to 30, 40 etc. in one place
  int _otpSeconds = 60;
  Timer? _otpTimer;

  int get otpSeconds => _otpSeconds;
  bool get isOtpTimerFinished => _otpSeconds == 0;

  void startOtpTimer() {
    _otpSeconds = _defaultOtpDuration;
    _otpTimer?.cancel();
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_otpSeconds == 0) {
        timer.cancel();
      } else {
        _otpSeconds--;
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void resetOtpTimer() {
    _otpTimer?.cancel();
    _otpSeconds = _defaultOtpDuration;
    notifyListeners();
  }

  @override
  void dispose() {
    _otpTimer?.cancel();
    super.dispose();
  }
}
