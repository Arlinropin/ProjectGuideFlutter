import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveButton(this.text, this.handler);

  void _handler() {
    handler();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Platform.isIOS
            ? CupertinoButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: _handler)
            : TextButton(
                onPressed: _handler,
                child: Text(
                  text,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                )));
  }
}
