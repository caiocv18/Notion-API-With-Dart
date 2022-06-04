import 'dart:convert';
import 'dart:io';

import 'NotionAPI.dart';
import 'bloc/Streams.dart';
import 'package:http/http.dart' as http;

import 'bloc/USDBRL.dart';
import 'bloc/User.dart';

void main(List<String> arguments) {
  // //print("===================== STREAM CONTROLLER 1 =====================");
  // streamController1();
  // print("===================== STREAM TRANSFORMER =====================");
  // streamTransformer();
  // print("===================== STREAM TRANSFORMER 2 =====================");
  // streamTransformer2();
  NotionAPI().get_users();
  //get_USD_BRL();
}

Future<void> get_USD_BRL() async {
  var path = "https://economia.awesomeapi.com.br/last/USD-BRL";

  var url = Uri.parse(path);

  var response = await http.get(url);

  print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");
  final jsonData = response.body;
  final parsedJson = jsonDecode(jsonData);
  print('${parsedJson.runtimeType} : $parsedJson');
  var usdBrl = USDBRL();
  usdBrl.code = parsedJson["code"];
  usdBrl.codein = parsedJson["codein"];
  usdBrl.name = parsedJson["name"];
  usdBrl.high = parsedJson["high"] as double;
  usdBrl.low = parsedJson["low"] as double;
  usdBrl.timestamp = parsedJson["timestamp"];
  print('\n\n\n${usdBrl.name}\n\n\n');
}
