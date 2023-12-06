
import 'package:flutter/material.dart';

class QuoterController with ChangeNotifier{
  int _quoterIndex = 0; 
  double _purchasePrice = 0;
  double _salePrice = 0; 
  double _inputMountCompra = 0; 
  double _outputMountCompra = 0; 
  TextEditingController _textEditingController = TextEditingController();
  
  double _inputMountVenta = 0; 
  double _outputMountVenta = 0;


  TextEditingController get textEditingController =>_textEditingController;
  set textEditingController (TextEditingController valor){
    _textEditingController = valor;
    notifyListeners();
  }

  int get quoterIndex =>_quoterIndex;
  set quoterIndex (int valor){
    _quoterIndex = valor;
    notifyListeners();
  }

  double get purchasePrice =>_purchasePrice;
  set purchasePrice (double valor){
    _purchasePrice = valor;
    notifyListeners();
  }

  double get inputMountCompra =>_inputMountCompra;
  set inputMountCompra (double valor){
    _inputMountCompra = valor;
    notifyListeners();
  }

  double get outputMountCompra =>_outputMountCompra;
  set outputMountCompra (double valor){
    _outputMountCompra = valor;
    notifyListeners();
  }

  double get inputMountVenta =>_inputMountVenta;
  set inputMountVenta (double valor){
    _inputMountVenta = valor;
    notifyListeners();
  }

  double get outputMountVenta =>_outputMountVenta;
  set outputMountVenta (double valor){
    _outputMountVenta = valor;
    notifyListeners();
  }

  double get salePrice =>_salePrice;
  set salePrice (double valor){
    _salePrice = valor;
    notifyListeners();
  }

}