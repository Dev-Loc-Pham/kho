import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_layout/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List catarory = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    var appstate = context.watch<AppSate>();
    var pair = appstate.favourite;
    var theme = Theme.of(context);

    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: catarory.length,
      itemBuilder: (context, index) {
        int value = catarory[index];
        return Container(
          child: ListTile(
            onTap: () {},
            leading: CircleAvatar(
              backgroundColor: theme.primaryColor,
            ),
            title: Text('Item ${index}'),
            trailing: Container(
              width: 60,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  appstate.add_ele(value);
                  if (catarory[index] == 0) {
                    catarory[index] = 1;
                  } else {
                    catarory[index] = 0;
                  }
                  setState(() {});
                },
                icon: Icon(
                  value == 0 ? Icons.favorite : Icons.favorite_border,
                  color: theme.primaryColor,
                ),
                label: Text(''),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}

class Item extends StatelessWidget {
  Item({
    super.key,
    required this.i,
    required this.appstate,
    required this.theme,
  });

  int i;
  AppSate appstate;
  ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          backgroundColor: theme.primaryColor,
        ),
        title: Text('Item${i}'),
        trailing: Container(
          width: 60,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              appstate.add_ele(i);
              if (i == 0) {
                i = 1;
              } else {
                i = 0;
              }
            },
            icon: Icon(
              i == 0 ? Icons.favorite : Icons.favorite_border,
              color: theme.primaryColor,
            ),
            label: Text(''),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
          ),
        ),
      ),
    );
  }
}
