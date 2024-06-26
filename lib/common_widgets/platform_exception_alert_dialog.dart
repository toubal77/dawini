import 'package:dawini/common_widgets/platform_alert_dialog.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:flutter/src/foundation/key.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    Key? key,
    String title = 'Error',
    required Exception exception,
  }) : super(
          key: key,
          title: title,
          content: _message(exception),
          defaultActionText: 'OK',
        );

  static String _message(Exception exception) {
    // if (exception is FirebaseAuthException) {
    //   return _errors[exception.code] ?? exception.message ?? '';
    // }
    if (exception is PlatformException) {
      return _errors[exception.code] ?? exception.message ?? '';
    }

    return 'Error unknown';
  }

  static final Map<String, String> _errors = {
    ///  `ERROR_WEAK_PASSWORD` - If the password is not strong enough.
    ///  `ERROR_INVALID_CREDENTIAL` - If the email address is malformed.
  };
}
