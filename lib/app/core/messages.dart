import 'package:flutter/material.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showErrorWithCloseButton(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      textAlign: TextAlign.justify,
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      foregroundColor: Color(0xFF721c24),
      backgroundColor: Color(0xFFf8d7da),
      borderColor: Color(0xFFf5c6cb),
      duration: const Duration(seconds: 25),
      closeButton: true,
      fixed: fixed ?? false,
    );
  }

  void showError(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: Color(0xFF721c24),
      backgroundColor: Color(0xFFf8d7da),
      borderColor: Color(0xFFf5c6cb),
      fixed: fixed ?? false,
    );
  }

  void showWarning(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: Color(0xFF856404),
      backgroundColor: Color(0xFFfff3cd),
      borderColor: Color(0xFFffeeba),
      fixed: fixed ?? false,
    );
  }

  void showInfo(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: Color(0xFF0c5460),
      backgroundColor: Color(0xFFd1ecf1),
      borderColor: Color(0xFFbee5eb),
      fixed: fixed ?? false,
    );
  }

  void showSuccess(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: Color(0xFF155724),
      backgroundColor: Color(0xFFd4edda),
      borderColor: Color(0xFFc3e6cb),
      fixed: fixed ?? false,
    );
  }

  void _showSnackbarCustom({
    required String message,
    required Color backgroundColor,
    required Color foregroundColor,
    required Color borderColor,
    required bool fixed,
    EdgeInsetsGeometry padding = const EdgeInsets.all(10),
    Duration duration = const Duration(seconds: 5),
    bool closeButton = false,
    TextAlign textAlign = TextAlign.justify,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        elevation: 5,
        behavior: fixed ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          //side: BorderSide(color: borderColor, width: 1.25),
        ),
        duration: duration,
        backgroundColor: backgroundColor,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message.trim(),
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: foregroundColor, fontSize: 17),
                ),
              ),
              Visibility(
                visible: closeButton,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    onTap: () {
                      if (mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    child: Text(
                      'Fechar',
                      style: TextStyle(color: foregroundColor, fontWeight: FontWeight.w800, fontSize: 13),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
