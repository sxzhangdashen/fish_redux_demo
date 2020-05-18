import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AuthButtonLoadingScaffold extends StatelessWidget {
  const AuthButtonLoadingScaffold(
      {Key key, @required this.isLoading, @required this.buttonHeight})
      : super(key: key);
  final bool isLoading;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: SpinKitThreeBounce(
            color: Colors.white,
            size: buttonHeight,
          ))
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('登录',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ],
          );
  }
}
