import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  RoundedButton(
      {@required this.text, @required this.color, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

class MessageBox extends StatefulWidget {
  String message;

  MessageBox(@required this.message);

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          elevation: 5,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Center(
              child: Text(
                widget.message,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
