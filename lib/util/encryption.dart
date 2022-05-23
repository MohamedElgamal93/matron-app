// //   Flutter encryption
// import 'package:encrypt/encrypt.dart';
// import 'package:encrypt/encrypt.dart' as keyEncrypt;

// import 'constants/show_log.dart';

// String encrypt(String text) {
//   final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
//   final encrypted = encrypter.encrypt(text, iv: iv);
//   return encrypted.base64;
// }

// // GWT public key - privet key
// //

// String decrypt(var text) {
//   final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
//   final decrypted = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);

//   return decrypted;
// }

// final iv = IV.fromUtf8('q2SxEuacf6h2KGAp'); //16 chars
// final key =
//     keyEncrypt.Key.fromUtf8('Nd8BQAAABFyb290QG1hZ2VkLXNoYWtlc'); //32 chars
