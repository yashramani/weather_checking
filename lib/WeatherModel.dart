class WeatherModel {
  double temp;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  WeatherModel(
      {this.temp, this.tempMin, this.tempMax, this.pressure, this.humidity});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['temp'] = this.temp;
    data['temp_min'] = this.tempMin;
    data['temp_max'] = this.tempMax;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    return data;
  }
}
