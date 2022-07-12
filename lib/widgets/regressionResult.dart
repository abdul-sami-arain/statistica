import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:statistica/controller/controllerr.dart';
import 'package:statistica/widgets/lineGraph.dart';
import 'package:statistica/widgets/scatterGraph.dart';

class RegressionResult extends StatelessWidget {
  const RegressionResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState provider = Provider.of<AppState>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:  Color.fromARGB(255, 7, 184, 194),
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("X",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),),
                      
                      Text("Y",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),),
                     
                      Text("X*Y",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),),
                     
                      Text("X*X",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),),
                       Text("Y*Y",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Flexible(
                        child: ListView.builder(
                            shrinkWrap: true,
                            reverse: false,
                            itemCount: provider.lst.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(provider.lst[index].toString()),
                              );
                            }),
                      ),
                      Flexible(
                        child: ListView.builder(
                            shrinkWrap: true,
                            reverse: false,
                            itemCount: provider.lst2.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(provider.lst2[index].toString()),
                              );
                            }),
                      ),
                      Flexible(
                        child: ListView.builder(
                            shrinkWrap: true,
                            reverse: false,
                            itemCount: provider.Mult.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(provider.Mult[index].toString()),
                              );
                            }),
                      ),
                      Flexible(
                        child: ListView.builder(
                            shrinkWrap: true,
                            reverse: false,
                            itemCount: provider.SqColumn1.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title:
                                    Text(provider.SqColumn1[index].toString()),
                              );
                            }),
                      ),
                      Flexible(
                        child: ListView.builder(
                            shrinkWrap: true,
                            reverse: false,
                            itemCount: provider.SqColumn2.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title:
                                    Text(provider.SqColumn2[index].toString()),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Text("Y(estimated) = ${provider.Intercept.toStringAsFixed(3)} + ${provider.Coef_of_Ind_Variable.toStringAsFixed(3)}X"
                ,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.amber),
                ),
                SizedBox(
                  height: 300.h,
                  width: double.infinity,
                  child: FlChart(),
                ),
                SizedBox(
                  height: 300.h,
                  width: double.infinity,
                  child: FlChart2(),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side:
                          BorderSide(color: Color.fromARGB(255, 7, 184, 194))),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FlChart()));
                  },
                  padding: EdgeInsets.all(10.0),
                  color: Color(0xffF1B201),
                  textColor: Colors.white,
                  child: Container(
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      "SCATTER PLOT",
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    )),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
