import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class SMSInbox extends StatefulWidget {
  @override
  _SMSInboxState createState() => _SMSInboxState();
}

class _SMSInboxState extends State<SMSInbox> {
  SmsQuery query = new SmsQuery();
  List<SmsMessage> messages = new List<SmsMessage>();

  fetchSMS() async {
    messages = await query.getAllSms;
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS Inbox"),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: fetchSMS(),
        builder: (context, snapshot) {
          return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 5, bottom: 5),
                    child: MaterialButton(
                      child: ListTile(
                        leading: Icon(
                          Icons.markunread,
                          color: Colors.red,
                        ),
                        title: Text(messages[index].address),
                        subtitle: Text(
                          messages[index].body,
                          maxLines: 1,
                          style: TextStyle(),
                        ),
                      ),
                      onPressed: () {
                        SmsMessage sms = messages[index];
                        Navigator.pop(context, sms);
                      },
                    ));
              });
        },
      ),
    );
  }
}
