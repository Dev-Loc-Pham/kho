import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_layout/main.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appstate = context.watch<AppSate>();
    var pair = appstate.favourite;
    var theme = Theme.of(context);
    return Container(
        child: ListView(
      children: [
        for (var i in pair)
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
            ),
            title: Text('Item${i}'),
            trailing: Container(
              width: 60,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  appstate.remove_ele(i);
                },
                icon: Icon(
                  Icons.cancel,
                  color: theme.primaryColor,
                ),
                label: Text(''),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
              ),
            ),
          )
      ],
    ));
  }
}
