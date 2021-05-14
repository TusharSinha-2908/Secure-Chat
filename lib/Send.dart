import 'package:flutter/material.dart';
import 'package:cipher2/cipher2.dart';
import 'package:sms/sms.dart';
import 'Constants.dart';

final myController = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();

String _recipient_no = '';
String _message = '';
String _messageR = '';

class Send extends StatefulWidget {
  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<Send> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: myController3,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter Recipient\'s number',
              labelText: 'Contact Number',
              //hasFloatingPlaceholder: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 4,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 4,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              border: UnderlineInputBorder(),
            ),
            cursorColor: Colors.white,
            onSaved: (value) => _recipient_no = value,
            validator: (value) =>
                value.length != 10 ? "Enter a valid number" : null,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: myController,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Enter the message',
              labelText: 'Message',
              //hasFloatingPlaceholder: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 4,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 4,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 4,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                  width: 4,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              border: UnderlineInputBorder(),
            ),
            cursorColor: Colors.white,
            onSaved: (value) => _recipient_no = value,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: TextFormField(
              obscureText: true,
              controller: myController2,
              decoration: const InputDecoration(
                icon: Icon(Icons.vpn_key),
                hintText: 'Enter Encryption Key',
                labelText: 'Key (16 characters)',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 4,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 4,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 4,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                border: UnderlineInputBorder(),
              ),
              cursorColor: Colors.white,
              onSaved: (value) => _recipient_no = value,
              validator: (value) =>
                  value.length != 16 ? "Enter a key with 16 characters." : null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 5),
          child: RoundedButton(
              text: "Encrypt The Message",
              color: Colors.redAccent,
              onPressed: () async {
                String plainText = myController.text;
                String key = myController2.text;
                String nonce = '+QVNyK7dTosxe8QU';
                _message = await Cipher2.encryptAesCbc128Padding7(
                    plainText, key, nonce);
                setState(() {
                  _messageR = _message;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
          child: Text(
            'Message After Encryption :',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey[600]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
          child: MessageBox(_messageR),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 0, horizontal: 100), //(150, 0, 150, 10),
          child: RoundedButton(
            text: "Send",
            color: Colors.redAccent,
            onPressed: () {
              _recipient_no = myController3.text;
              SmsSender sender = new SmsSender();
              sender.sendSms(new SmsMessage(_recipient_no, _message));
            },
          ),
        )
      ],
    );
  }
}
