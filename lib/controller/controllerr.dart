import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statistica/widgets/model1.dart';
import 'package:statistica/widgets/regression.dart';
import 'package:statistica/widgets/regressionResult.dart';

class XYDATA {
  late final double X;
  late final double Y;
  static const kPrimaryColor = Colors.amber;
  XYDATA(this.X, this.Y);
}

class LINEG {
  late final double X;
  late final double ESTY;
  late final kPrimaryColor = Color(0xFF394497);
  LINEG(this.X, this.ESTY);
}

class AppState extends ChangeNotifier {
  double Col1Sum = 0;
  double Col2Sum = 0;
  double MultSum = 0;
  double Col1Mean = 0;
  double Col2Mean = 0;
  double Col1SqSum = 0;
  double Col2SqSum = 0;
  double Coef_of_Ind_Variable = 0;
  double Intercept = 0;

  double SXY = 0;
  double SXX = 1;

  List<dynamic> Column1 = [];
  List<dynamic> Column2 = [];
  List<dynamic> Mult = [];
  List<dynamic> SqColumn1 = [];
  List<dynamic> SqColumn2 = [];
  final List<XYDATA> MergeXY = [];
  List<dynamic> EstimatedValues = [];
  final List<LINEG> LineGraph = [];

  final firstRfirstC = TextEditingController();
  final SecondRfirstC = TextEditingController();
  final ThirdRfirstC = TextEditingController();
  final FourthRfirstC = TextEditingController();
  final fifthRfirstC = TextEditingController();
  final SixthRfirstC = TextEditingController();
  final SeventhRfirstC = TextEditingController();
  final EightRfirstC = TextEditingController();
  final NinthRfirstC = TextEditingController();
  final TenthRfirstC = TextEditingController();

  final firstRsecondC = TextEditingController();
  final SecondRsecondC = TextEditingController();
  final ThirdRsecondC = TextEditingController();
  final FourthRsecondC = TextEditingController();
  final fifthRsecondC = TextEditingController();
  final SixthRsecondC = TextEditingController();
  final SeventhRsecondC = TextEditingController();
  final EightRsecondC = TextEditingController();
  final NinthRsecondC = TextEditingController();
  final TenthRsecondC = TextEditingController();

  void Regression() {
    Column1.add(double.parse(TenthRfirstC.text));
    Column1.add(double.parse(NinthRfirstC.text));
    Column1.add(double.parse(EightRfirstC.text));
    Column1.add(double.parse(SeventhRfirstC.text));
    Column1.add(double.parse(SixthRfirstC.text));
    Column1.add(double.parse(fifthRfirstC.text));
    Column1.add(double.parse(FourthRfirstC.text));
    Column1.add(double.parse(ThirdRfirstC.text));
    Column1.add(double.parse(SecondRfirstC.text));
    Column1.add(double.parse(firstRfirstC.text));

    Column2.add(double.parse(TenthRsecondC.text));
    Column2.add(double.parse(NinthRsecondC.text));
    Column2.add(double.parse(EightRsecondC.text));
    Column2.add(double.parse(SeventhRsecondC.text));
    Column2.add(double.parse(SixthRsecondC.text));
    Column2.add(double.parse(fifthRsecondC.text));
    Column2.add(double.parse(FourthRsecondC.text));
    Column2.add(double.parse(ThirdRsecondC.text));
    Column2.add(double.parse(SecondRsecondC.text));
    Column2.add(double.parse(firstRsecondC.text));

    // multiplication of column 1 and column 2
    for (var i = 0; i < Column1.length; i++) {
      Mult.add(Column1[i] * Column2[i]);
    }
    //sum of multiplication of column 1 and column 2
    for (var i = 0; i < Column1.length; i++) {
      MultSum += double.parse(Mult[i].toString());
    }
    // sum of column 1
    for (var i = 0; i < Column1.length; i++) {
      Col1Sum += double.parse(Column1[i].toString());
    }
    // sum of column 1
    for (var i = 0; i < Column2.length; i++) {
      Col2Sum += double.parse(Column2[i].toString());
    }
    // mean of column 1
    Col1Mean = Col1Sum / Column1.length;
    // mean of column 2
    Col2Mean = Col2Sum / Column2.length;
    // square of column 1
    for (var i = 0; i < Column1.length; i++) {
      SqColumn1.add(Column1[i] * Column1[i]);
    }
    //sum of square of column 1
    for (var i = 0; i < Column1.length; i++) {
      Col1SqSum += double.parse(SqColumn1[i].toString());
    }
    // square of column 2
    for (var i = 0; i < Column1.length; i++) {
      SqColumn2.add(Column2[i] * Column2[i]);
    }
    //sum of square of column 2
    for (var i = 0; i < Column2.length; i++) {
      Col2SqSum += double.parse(SqColumn2[i].toString());
    }
    for (var i = 0; i < Column1.length; i++) {
      MergeXY.add(XYDATA(Column1[i], Column2[i]));
    }

    SXY = (MultSum - ((Column1.length) * Col1Mean * Col2Mean));
    SXX = (Col1SqSum - ((Column1.length) * (Col1Mean * Col1Mean)));
    Coef_of_Ind_Variable = SXY / SXX;

    Intercept = Col2Mean - (Coef_of_Ind_Variable * Col1Mean);

    for (var i = 0; i < Column1.length; i++) {
      double y = (Intercept +
          (double.parse(Column1[i].toString()) * Coef_of_Ind_Variable));
      print(y);
      EstimatedValues.add(y);
    }
    for (var i = 0; i < Column1.length; i++) {
      LineGraph.add(LINEG(Column1[i], EstimatedValues[i]));
    }

    print(Column1.reversed.toList());
    print(Col1Sum);
    print(Col1Mean);
    print(Column2.reversed.toList());
    print(Col2Sum);
    print(Col2Mean);
    print(SqColumn1.reversed.toList());
    print(Col1SqSum);
    print(SqColumn2.reversed.toList());
    print(Col1SqSum);
    print(Mult.reversed.toList());
    print(MultSum);
    print(SXY);
    print(SXX);
    print(Coef_of_Ind_Variable);
    print(Intercept);
    print(MergeXY[9].Y);
    print(EstimatedValues);

    notifyListeners();
    // print(TenthRsecondC.value);
  }

  final input1 = TextEditingController();
  final input2 = TextEditingController();
  List<dynamic> lst = [];
  List<dynamic> lst2 = [];

  void LinearRegression() {
    print("object");
    // multiplication of column 1 and column 2
    for (var i = 0; i < lst.length; i++) {
      Mult.add(double.parse(lst[i]) * double.parse(lst2[i]));
    }
    //sum of multiplication of column 1 and column 2
    for (var i = 0; i < lst.length; i++) {
      MultSum += double.parse(Mult[i].toString());
    }
    // sum of column 1
    for (var i = 0; i < lst.length; i++) {
      Col1Sum += double.parse(lst[i]);
    }
    // sum of column 2
    for (var i = 0; i < lst2.length; i++) {
      Col2Sum += double.parse(lst2[i]);
    }
    // mean of column 1
    Col1Mean = Col1Sum / lst.length;
    // mean of column 2
    Col2Mean = Col2Sum / lst2.length;
    // square of column 1
    for (var i = 0; i < lst.length; i++) {
      SqColumn1.add(double.parse(lst[i]) * double.parse(lst[i]));
    }
    //sum of square of column 1
    for (var i = 0; i < lst.length; i++) {
      Col1SqSum += double.parse(SqColumn1[i].toString());
    }
    // square of column 2
    for (var i = 0; i < lst2.length; i++) {
      SqColumn2.add(double.parse(lst2[i]) * double.parse(lst2[i]));
    }
    //sum of square of column 2
    for (var i = 0; i < lst2.length; i++) {
      Col2SqSum += double.parse(SqColumn2[i].toString());
    }
    // Graph 1
    for (var i = 0; i < lst.length; i++) {
      MergeXY.add(XYDATA(double.parse(lst[i]), double.parse(lst2[i])));
    }

    SXY = (MultSum - ((lst.length) * Col1Mean * Col2Mean));
    SXX = (Col1SqSum - ((lst.length) * (Col1Mean * Col1Mean)));
    Coef_of_Ind_Variable = SXY / SXX;

    Intercept = Col2Mean - (Coef_of_Ind_Variable * Col1Mean);

    for (var i = 0; i < lst.length; i++) {
      double y = (Intercept + (double.parse(lst[i]) * Coef_of_Ind_Variable));
      print(y);
      EstimatedValues.add(y);
    }
    for (var i = 0; i < lst.length; i++) {
      LineGraph.add(LINEG(double.parse(lst[i]), EstimatedValues[i]));
    }

    print(lst);
    print(Col1Sum);
    print(Col1Mean);
    print(lst2);
    print(Col2Sum);
    print(Col2Mean);
    print(SqColumn1);
    print(Col1SqSum);
    print(SqColumn2);
    print(Col1SqSum);
    print(Mult);
    print(MultSum);
    print(SXY);
    print(SXX);
    print(Coef_of_Ind_Variable);
    print(Intercept);
    print(MergeXY[9].Y);
    print(EstimatedValues);

    notifyListeners();
  }
  Future Move(context) async{
   await  Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegressionResult()));
                          notifyListeners();
  }
  Clear() {
    double Col1Sum = 0;
    double Col2Sum = 0;
    double MultSum = 0;
    double Col1Mean = 0;
    double Col2Mean = 0;
    double Col1SqSum = 0;
    double Col2SqSum = 0;
    double Coef_of_Ind_Variable = 0;
    double Intercept = 0;
    lst.clear();
    lst2.clear();
    Mult.clear();
    SqColumn1.clear();
    SqColumn2.clear();
    MergeXY.clear();
    EstimatedValues.clear();
    LineGraph.clear();
    notifyListeners();
  }
}
