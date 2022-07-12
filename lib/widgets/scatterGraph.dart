import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:statistica/controller/controllerr.dart';

class FlChart extends StatelessWidget {
  Widget build(BuildContext context) {
    AppState provider = Provider.of<AppState>(context);

    List<charts.Series<XYDATA, double>> series = [
      charts.Series(
        id: "Subscribers",
        data: provider.MergeXY,
        domainFn: (XYDATA series, _) => series.X,
        measureFn: (XYDATA series, _) => series.Y,
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
                "SCATTER DIAGRAM",
                style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.amber),
                
              ),
              Expanded(
                child: charts.ScatterPlotChart(series),
              )
            ],
          ),
        ),
      ),
    );
  }
}

