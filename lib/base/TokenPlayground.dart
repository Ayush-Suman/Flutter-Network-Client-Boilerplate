import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenPlayground{
  static String _JWT="";
  static bool updated=false;

  /// JWT Functions
  static Future<Null> updateJWT() {
    FlutterSecureStorage().read(key: "JWT").
    then((onValue) {
      if (onValue!=null){
        _JWT=onValue;
      }else{
        _JWT="";
      }
      updated=true;
    }).catchError((onError){
      updateJWT();
    });
  }


  static String readJWT() => _JWT;

  static Future<bool> storeJWT(String JWT) =>
      FlutterSecureStorage().write(key: "JWT", value: JWT).
      then((onValue) {
        _JWT=JWT;
        return true;
      }).catchError((onError) => false);

  static Future<bool> deleteJWT() =>
      FlutterSecureStorage().delete(key: "JWT").
      then((onValue){
        _JWT="";
        return true;
      }).catchError((onError) => false);

}