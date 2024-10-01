import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

enum APIStatus { success, error }

enum Logtype { clockin, clockout }

class Helper {
  Future<bool> serverFileExists() async {
    final file = File('server.json');
    return await file.exists();
  }

  String GetCurrentDatetime() {
    DateTime currentDateTime = DateTime.now();
    String formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm').format(currentDateTime);
    return formattedDateTime;
  }

  String GetYesterdayDatetime() {
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(yesterday);
    return formattedDateTime;
  }

  Future<List<dynamic>> readJsonToFile1(String filePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$filePath');

    if (!file.existsSync()) {
      return [];
    }

    String jsonString = await file.readAsString();
    List<dynamic> jsonData = jsonDecode(jsonString);

    return jsonData;
  }

  Future<Map<String, dynamic>> readJsonToFile(String filePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$filePath');

    if (!file.existsSync()) {}
    String jsonString = await file.readAsString();

    Map<String, dynamic> jsonData = jsonDecode(jsonString);

    return jsonData;
  }

  Future<void> writeJsonToFile(
      Map<String, dynamic> jsnonData, String filePath) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$filePath');

      String jsonString = jsonEncode(jsnonData);

      await file.writeAsString(jsonString);
    } catch (e) {}
  }

  Future<String> readFileContent(String filePath) async {
    try {
      File file = File(filePath);
      return await file.readAsString();
    } catch (e) {
      return '';
    }
  }

  Future<void> deleteFile(String filepath) async {
    try {
      File file = File(filepath);

      if (await file.exists()) {
        await file.delete();
      } else {}
    } catch (e) {}
  }

  Future<void> JsonToFileWrite(
      Map<String, dynamic> jsonData, String filename) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$filename';

      // Write JSON data to file
      final file = File(filePath);

      await file.writeAsString(json.encode(jsonData));
    } catch (e) {}
  }

  Future<Map<String, dynamic>> JsonToFileRead(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$filename';
    final file = File(filePath);

    // Check if the file exists
    if (!file.existsSync()) {}

    // Read the contents of the file
    String jsonString = await file.readAsString();
    // Parse the JSON string into a Map
    Map<String, dynamic> jsonData = jsonDecode(jsonString);

    return jsonData;
  }

  String getStatusString(APIStatus status) {
    switch (status) {
      case APIStatus.success:
        return 'success';
      case APIStatus.error:
        return 'error';
      default:
        return "";
    }
  }

  String getLogtype(Logtype type) {
    switch (type) {
      case Logtype.clockin:
        return 'ClockIn';
      case Logtype.clockout:
        return 'ClockOut';
      default:
        return "";
    }
  }

  String GetCurrentDate() {
    DateTime currentDateTime = DateTime.now();
    String formattedDateTime = DateFormat('yyyy-MM-dd').format(currentDateTime);
    return formattedDateTime;
  }
}

Future<String> getDownloadDir() async {
  try {
    Directory? downloadsDirectory = await getExternalStorageDirectory();
    String finalpath = downloadsDirectory!.path;
    String removepath = '/Downloads/';
    String cleanPath = finalpath.replaceAll(removepath, '');
    return cleanPath;
  } catch (e) {
    return '';
  }
}