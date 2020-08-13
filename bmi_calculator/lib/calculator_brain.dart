import 'package:bmi_calculator/components/constant.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({@required this.weight,this.height});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    }else if (_bmi > 18.5) {
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }

  String getIndependen() {
    if (_bmi >= 25) {
      return 'Berat Badan mu berlebihan ayo diet';
    } else if (_bmi > 18.5) {
      return 'Tubuh kamu normal pertahankan';
    }else {
      return 'Kamu Perlu banyak makan';
    }
  }

  Color getColorText() {
    if (_bmi >= 25){
      return Colors.red;
    } else if (_bmi > 18.5) {
      return kColorResult;
    }else{
      return Colors.yellow;
    }
  }



}