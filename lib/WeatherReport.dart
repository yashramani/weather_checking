import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherchecking/WeatherModel.dart';

class WeatherReport {
  Future getWeather(String city) async {
    final result = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2");
    if (result.statusCode != 200) throw Exception();
    print(result.body);
    return result;
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);
  }
}
