import 'package:flutter/material.dart';

import '../../routes.dart';
import '../../services.dart';
import '../../shared/colors.dart';

class SettingsPageContent extends StatelessWidget {
  SettingsPageContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildContent(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: _decoration,
      child: Column(
        children: [
          ListTile(
            title: Text('Option'),
            dense: true,
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text('Option'),
            dense: true,
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text('Option'),
            dense: true,
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text('Option'),
            dense: true,
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text('Option'),
            dense: true,
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text('Log Out'),
            dense: true,
            leading: Icon(Icons.exit_to_app),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => signOut(context),
          ),
        ],
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {
    await AuthService.instance.signOut();
    await Routes.toHome(context);
  }

  final _decoration = BoxDecoration(
    color: white,
    boxShadow: [
      BoxShadow(color: Color.fromRGBO(0, 0, 0, .1), blurRadius: 10, spreadRadius: 5, offset: Offset(0, 1)),
    ],
    borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
  );
}
