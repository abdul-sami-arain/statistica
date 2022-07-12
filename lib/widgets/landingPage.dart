import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:statistica/controller/controllerr.dart';
import 'package:statistica/widgets/multipleRegression.dart';
import 'package:statistica/widgets/regression.dart';
import 'package:statistica/widgets/regressionResult.dart';
import 'package:statistica/widgets/scatterGraph.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 7, 184, 194),
          title: Text("STATISTIO"),
          centerTitle: true,
          titleSpacing: 1,
          leading: Icon(
            CupertinoIcons.square_grid_2x2,
            color: Colors.white,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 200.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                      fit: BoxFit.fill,
                    )),
                  ),
                ),
                Consumer<AppState>(
                  builder: (context, cart, child) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Color.fromARGB(255, 7, 184, 194))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute( builder: (context) => Regression()));
                        },
                        padding: EdgeInsets.all(10.0),
                        color: Color(0xffF1B201),
                        textColor: Colors.white,
                        child: Container(
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            "LINEAR REGRESSION",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          )),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side:
                            BorderSide(color: Color.fromARGB(255, 7, 184, 194))),
                    onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute( builder: (context) => Todo()));
                        },
                    padding: EdgeInsets.all(10.0),
                    color: Color(0xffF1B201),
                    textColor: Colors.white,
                    child: Container(
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "MULTIPLE REGRESSION",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side:
                            BorderSide(color: Color.fromARGB(255, 7, 184, 194))),
                    onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute( builder: (context) => FlChart()));
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Color(0xffF1B201),
                    textColor: Colors.white,
                    child: Container(
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "ONE-WAY ANOVA",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side:
                            BorderSide(color: Color.fromARGB(255, 7, 184, 194))),
                    onPressed: () {},
                    padding: EdgeInsets.all(10.0),
                    color: Color(0xffF1B201),
                    textColor: Colors.white,
                    child: Container(
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "TWO-WAY ANOVA",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side:
                            BorderSide(color: Color.fromARGB(255, 7, 184, 194))),
                    onPressed: () {},
                    padding: EdgeInsets.all(10.0),
                    color: Color(0xffF1B201),
                    textColor: Colors.white,
                    child: Container(
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "PLOT GRAPHS",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
