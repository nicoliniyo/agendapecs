import 'dart:io';


import 'package:app/classes/local_storage.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/card_pec.dart';
import 'package:app/widgets/list_droppable_pecs.dart';
import 'package:flutter/material.dart';

class LocalPecs extends StatefulWidget {
  const LocalPecs({super.key});

  @override
  State<LocalPecs> createState() {
    return _LocalPecs();
  }

}

class _LocalPecs extends State<LocalPecs> {
  bool variablesUpdated = false;
  late Widget blankPec ; //= sizedBoxBlank();
  late Widget blankPec2 ; //= sizedBoxBlank();
  List<File> column1Items = List.empty(growable: true);

  Widget sizedBoxBlank() {
    return Container(
      width: 100,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: Colors.black12,
      ),
    );
  }

  updateCatalog() async {
    column1Items = await LocalStorage().listPngFiles();
    setState(() {

    });

  }

  @override
  void initState() {
    super.initState();
    if(!variablesUpdated){
      updateCatalog();
    }

  }

  @override
  Widget build(BuildContext context)  {
    bool showPecsLane = true;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalogo Pecs (${column1Items.length})',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              setState(() {
                showPecsLane = false;
              });
            },
          ),
        ],
      ),
      drawer: const MainAppDrawer(),
      //body: const IndependentScrollableColumns(),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(

          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              width: 100,
              //flex: 1,
              child:
              ListView.builder(
                itemCount: column1Items.length,
                itemBuilder: (BuildContext context, int index) {
                  String titleFile = column1Items[index].path.split('/').last;
                  File itemFile = column1Items[index];
                  print(titleFile + ' -> ' + itemFile.path);
                  var internalCard = CardPec(title: titleFile, imgFile: itemFile);
                  // Wrap the CardPec with Draggable
                  return Column( children:
                    [
                      Text('$titleFile'),
                      internalCard,
                      SizedBox(height: 10,)
                    ]
                  );
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}