import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Link extends StatefulWidget {
  @override
  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link> {
  _launchurl() async {
    const url = 'https://www.linkedin.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "could not connect";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("click and link"),
      ),
      body: Center(
          child: IconButton(
        icon: Icon(Icons.link),
        onPressed: _launchurl,
      )),
    );
  }
}
