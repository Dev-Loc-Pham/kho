import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_layout/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var appstate = context.watch<AppSate>();
    var pair = appstate.favourite;
    var Item_list = appstate.item_list;
    var theme = Theme.of(context);

    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: Item_list.length,
      itemBuilder: (context, index) {
        return Container(
          child: ListTile(
            onTap: () {},
            leading: CircleAvatar(
              backgroundColor: Item_list[index].color,
            ),
            title: Text(Item_list[index].title),
            trailing: Container(
              width: 60,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  appstate.add_ele(Item_list[index]);
                  appstate.marked(Item_list[index].id);
                  setState(() {});
                },
                icon: Icon(
                  Item_list[index].mark
                      ? Icons.favorite
                      : Icons.favorite_border,
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
