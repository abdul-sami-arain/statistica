import 'dart:math';
import 'dart:ui';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:statistica/controller/controllerr.dart';

class FlChart2 extends StatelessWidget {
  const FlChart2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     AppState provider = Provider.of<AppState>(context);

    List<charts.Series<LINEG, double>> series = [
      charts.Series(
        id: "Subscribers",
        data: provider.LineGraph,
        domainFn: (LINEG series, _) => series.X,
        measureFn: (LINEG series, _) => series.ESTY,
      )
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "ESTIMATION LINE"
                ,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.amber),
              ),
              Expanded(
                child: charts.LineChart(series,animate: true,),
              )
            ],
          ),
        ),
      ),
    );
  }
}