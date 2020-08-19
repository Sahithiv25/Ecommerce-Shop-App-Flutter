import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';
class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

   bool get isAuth {
      return token != null;
   }

   String get token{
     if(_expiryDate != null && _expiryDate.isAfter(DateTime.now()) && _token!=null){
       return token;
     }
     return _token;
   }

  Future<void> _authenticate(String email, String password,String urlSegment) async{
     final url = 'https://googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyD9yr4jqemHNm_QNLB_o59uubp6n3zDhpM';
     try {
            final response = await http.post(url,body:
    json.encode({
    'email':email,
    'password':password,
    'returnSecureToken':true,
    },
    ),
    );
    final responseData = json.decode(response.body); 
    if(responseData['error']!=null){
      throw HttpException(responseData['error']['message']);
    }
    _token = responseData['idToken'];
    _userId = responseData['localId'];
    _expiryDate = DateTime.now().add(Duration(seconds:int.parse(responseData['expireDate'])),);
     notifyListeners();
     }catch(error){
       throw error;
     }

    
  }

  Future<void> signup(String email,String password) async {
      return _authenticate(email, password, 'signupNewUser');
  }

  Future<void> signin(String email,String password) async {
    return _authenticate(email, password, 'verifyPassword');

  }

}