import 'dart:convert' as convert;

import 'package:crypto/crypto.dart';

class EncryptUtils {
  // Singleton approach
  static final EncryptUtils _instance = EncryptUtils._internal();
  factory EncryptUtils() => _instance;
  EncryptUtils._internal();

  static String encodeBase64(String data) {
    var content = convert.utf8.encode(data);
    var digest = convert.base64Encode(content);
    return digest;
  }

  static String decodeBase64(String data) {
    List<int> bytes = convert.base64Decode(data);
    String result = convert.utf8.decode(bytes);
    return result;
  }

  static String encodeMD5(String data) {
    var bytes = convert.utf8.encode(data);
    Digest md5Result = md5.convert(bytes);
    return md5Result.toString();
  }
}
