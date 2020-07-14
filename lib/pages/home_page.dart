import 'package:flutter/material.dart';
import '../router.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: [
          ...PageInfo.all.map((info) {
            final routeName = info.routeName;
            return ListTile(
              title: Text(pascalCaseFromRouteName(routeName)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).pushNamed(routeName),
            );
          }),
        ],
      ),
    );
  }
}
