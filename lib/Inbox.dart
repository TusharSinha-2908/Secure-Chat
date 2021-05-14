import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'Constants.dart';
import 'SMSInbox.dart';
import 'package:cipher2/cipher2.dart';

String _recieved_message = 'No Message Selected!';
String _sender_no = 'No Sender Selected!';
String _recipient_no = '';
String _decrypted_message = '';
String _decrypted_messageR = '';

final myController4 = TextEditingController();
final myController2 = TextEditingController();

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70, right: 70),
          child: RoundedButton(
            text: 'Select From Inbox',
            color: Colors.red,
            onPressed: () async {
              SmsMessage sms = await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SMSInbox()));
              setState(() {
                _recieved_message = sms.body;
                _sender_no = sms.address;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 10, 20, 5),
          child: Text(
            'Sender\'s Detail :',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey[600]),
          ),
        ),
        Row(
          children: [
            SizedBox(width: 10),
            Icon(
              Icons.account_box,
              color: Colors.grey[600],
              size: 25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 20, 0),
                child: MessageBox(_sender_no),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width: 10),
            Icon(
              Icons.message,
              color: Colors.grey[600],
              size: 25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 20, 0),
                child: MessageBox(_recieved_message),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
          child: Expanded(
            child: TextFormField(
              obscureText: true,
              controller: myController4,
              decoration: const InputDecoration(
                icon: Icon(Icons.vpn_key_sharp),
                hintText: 'Enter Key To Decrypt The Message',
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
                    color: Colors.redAccent,
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
                    color: Colors.redAccent,
                    width: 4,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                border: UnderlineInputBorder(),
              ),
              cursorColor: Colors.white,
              onSaved: (value) => _recipient_no = value,
              validator: (value) =>
                  value.length != 16 ? "Enter a valid key" : null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: RoundedButton(
            text: "Decrypt The Message",
            color: Colors.red,
            onPressed: () async {
              String key = myController2.text;
              String nonce = '+QVNyK7dTosxe8QU';
              String enteredPassword = myController4
                  .text; //The password user enters. Should be used for decryption.
              _decrypted_message = await Cipher2.decryptAesCbc128Padding7(
                  _recieved_message, enteredPassword, nonce);
              setState(() {
                _decrypted_messageR = _decrypted_message;
              });
              print(_decrypted_messageR);
            },
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
          child: Text(
            'Message After Decryption :',
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
          child: MessageBox(_decrypted_messageR),
        ),
      ],
    );
  }
}
