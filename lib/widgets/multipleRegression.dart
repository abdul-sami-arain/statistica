import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:statistica/controller/controllerr.dart';
import 'package:statistica/widgets/lineGraph.dart';
import 'package:statistica/widgets/regressionResult.dart';
import 'package:statistica/widgets/scatterGraph.dart';

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState provider = Provider.of<AppState>(context);
    return Scaffold(
      body: ListView.builder(
          itemCount: provider.lst.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                margin: EdgeInsets.only(top: 15),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text("${provider.lst[index]}"),
                        SizedBox(
                          width: 150.w,
                        ),
                        Text("${provider.lst2[index]}"),
                      ],
                    ),
                  ),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Icon(Icons.edit),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Item"),
                                    content: Column(
                                      children: [
                                        TextField(
                                          controller: provider.input1,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                        TextField(
                                          controller: provider.input2,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            provider.lst.replaceRange(
                                                index,
                                                index + 1,
                                                {provider.input1.text});

                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Edit"))
                                    ],
                                  );
                                });
                          },
                        ),
                        GestureDetector(
                          child: Icon(Icons.delete),
                          onTap: () {
                            provider.lst.removeAt(index);
                            provider.lst2.removeAt(index);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Todo()));
                          },
                        ),
                      ],
                    ),
                  ),
                ));
          }),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  child: Text("Done"),
                  onPressed:
                    provider.LinearRegression,
                    
                  ),
              FloatingActionButton(
                  child: Text("results"),
                  onPressed: () {
                   
                  }),
              FloatingActionButton(
                  child: Text("Clear"),
                  onPressed: () {
                    provider.Clear();
                  }),
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 10,
                          child: AlertDialog(
                            
                            shape: RoundedRectangleBorder(
                            
                              borderRadius:BorderRadius.circular(10),
                              
                               ),
                            title: Text("Add Item"),
                            content: Column(
                              children: [
                                TextField(
                                  controller: provider.input1,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                                TextField(
                                  controller: provider.input2,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    provider.lst.add(provider.input1.text);
                                    provider.lst2.add(provider.input2.text);

                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Add"))
                            ],   
                          ),
                        );
                      });
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
