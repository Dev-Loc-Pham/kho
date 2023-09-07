import 'package:flutter/material.dart';
import 'package:flutter_layout/screens/favourite.dart';
import 'package:flutter_layout/screens/myhomepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_layout/data/item_data.dart';
import 'package:flutter_layout/models/item.dart' as superitem;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Widget page = MyHomePage();
int page_num = 0;

void PageChange() {
  if (page_num == 0) {
    page = MyHomePage();
  } else {
    page = FavouritePage();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppSate(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange)),
          home: Scaffold(
            appBar: AppBar(
              title: Text('Testing Sample'),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        page_num = page_num == 0 ? 1 : 0;
                        PageChange();
                        print(page_num);
                      });
                    },
                    icon: Icon(Icons.favorite_border),
                    label: Text('Favourite')),
              ],
            ),
            body: page,
          )),
    );
  }
}

class AppSate extends ChangeNotifier {
  var item_list = Item_List;

  void marked(int id) {
    var index = item_list.indexWhere((e) => e.id == id);
    item_list[index].mark = !item_list[index].mark;
    notifyListeners();
  }

  List<superitem.Item> favourite = [];
  void add_ele(e) {
    if (favourite.contains(e)) {
      print('it already have');
    } else {
      favourite.add(e);
      notifyListeners();
    }
  }

  void remove_ele(e) {
    favourite.remove(e);

    notifyListeners();
  }
}
