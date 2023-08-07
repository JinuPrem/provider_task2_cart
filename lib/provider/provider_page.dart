import 'package:flutter/cupertino.dart';

class Provider_class extends ChangeNotifier{
  List _favName=[];
  List _favUnit=[];
  List _favPrice=[];
  List _favImages=[];

  List get favoriteName=>_favName;
  List get favoriteUnit=>_favUnit;
  List get favoritePrice=>_favPrice;
  List get favoriteImages=>_favImages;

  void favorites(String name,unit,price,image){
    final favNameList = _favName.contains(name);
    if(favNameList){
      _favName.remove(name);
      _favUnit.remove(unit);
      _favPrice.remove(price);
      _favImages.remove(image);
    }else{
      _favName.add(name);
      _favUnit.add(unit);
      _favPrice.add(price);
      _favImages.add(image);
    }
    notifyListeners();

  }


  }