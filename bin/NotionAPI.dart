import 'dart:io';
import 'package:http/http.dart' as http;

class NotionAPI {
  Future<void> get_users() async {
    var path = "https://api.notion.com/v1/users";
    var token = "secret_R8a2Rm6rmRAQJ6zIjVdBx45fUUS2Z4ozwZkJIWBs5i8";

    var url = Uri.parse(path);

    var response = await http.get(url, headers: {
      'Notion-Version': '2022-02-22',
      HttpHeaders.authorizationHeader: token
    });

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  }
}
