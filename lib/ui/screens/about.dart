import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:package_info/package_info.dart';

import '../../util/url.dart';
import '../../widgets/list_cell.dart';
import '../../widgets/separator.dart';

/// ABOUT SCREEN
/// This view contains a list with useful
/// information about the app & its developer.
class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<Null> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() => _packageInfo = info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        ListCell(
          leading: const Icon(Icons.info_outline, size: 40),
          title: 'About Project: Ginger',
          subtitle: 'v${_packageInfo.version} - release',
        ),
        Separator.divider(height: 0, indent: 72),
        ListCell(
          leading: const Icon(Icons.person_outline, size: 40),
          title: 'Created by an amazing team',
          subtitle: 'i62lucoc, V1ckyuwu & jesusrp98',
        ),
        Separator.divider(height: 0, indent: 72),
        ListCell(
          leading: const Icon(Icons.star_border, size: 40),
          title: 'Enjoying the app?',
          subtitle: 'Leave your experience in the store page',
          onTap: () async => await FlutterWebBrowser.openWebPage(
                url: Url.gingerStore,
                androidToolbarColor: Theme.of(context).primaryColor,
              ),
        ),
        Separator.divider(height: 0, indent: 72),
        ListCell(
          leading: const Icon(Icons.mail_outline, size: 40),
          title: 'Send an email',
          subtitle: 'Report nasty bugs or request new features',
          onTap: () async => await FlutterMailer.send(MailOptions(
                subject: Url.email['subject'],
                recipients: [Url.email['address']],
              )),
        ),
        Separator.divider(height: 0, indent: 72),
        ListCell(
          leading: const Icon(Icons.apps, size: 40),
          title: 'More from this author',
          subtitle: 'Well designed, open-source apps',
          onTap: () async => await FlutterWebBrowser.openWebPage(
                url: Url.authorStore,
                androidToolbarColor: Theme.of(context).primaryColor,
              ),
        ),
        Separator.divider(height: 0, indent: 72),
        ListCell(
          leading: const Icon(Icons.people_outline, size: 40),
          title: 'This is free software',
          subtitle: 'Source code is available on GitHub for everyone',
          onTap: () async => await FlutterWebBrowser.openWebPage(
                url: Url.gingerGithub,
                androidToolbarColor: Theme.of(context).primaryColor,
              ),
        ),
        Separator.divider(height: 0, indent: 72),
        ListCell(
          leading: const Icon(Icons.code, size: 40),
          title: 'Built with Flutter',
          subtitle: 'Beautiful native apps in record time',
          onTap: () async => await FlutterWebBrowser.openWebPage(
                url: Url.flutterPage,
                androidToolbarColor: Theme.of(context).primaryColor,
              ),
        ),
        Separator.divider(height: 0, indent: 72),
      ]),
    );
  }
}
