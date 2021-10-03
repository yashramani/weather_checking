import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherchecking/HomePage.dart';
import 'package:weatherchecking/WeatherModel.dart';
import 'package:weatherchecking/WeatherReport.dart';

class ShowWeather extends StatefulWidget {
  final city;
  String temp;
  ShowWeather(this.city, {this.temp});
  @override
  _ShowWeatherState createState() => _ShowWeatherState(city);
}

class _ShowWeatherState extends State<ShowWeather> {
  final city;
  String temp;
  _ShowWeatherState(this.city, {this.temp});
  WeatherReport weatherReport = WeatherReport();
  WeatherModel weatherModel = WeatherModel();

  int _number = 0;
  int _minTemp = 0;
  int _maxTemp = 0;

  void GenerateRandomNumber() {
    final _random = Random();
    int next(int min, int max) => min + _random.nextInt(max - min);
    setState(() {
      _number = next(20, 50);
    });
  }

  void MaxTemp() {
    final _random = Random();
    int next(int min, int max) => min + _random.nextInt(max - min);
    setState(() {
      _maxTemp = next(40, 50);
    });
  }

  void MinTemp() {
    final _random = Random();
    int next(int min, int max) => min + _random.nextInt(max - min);
    setState(() {
      _minTemp = next(20, 30);
    });
  }

  @override
  void initState() {
    weatherReport.getWeather(city);
    GenerateRandomNumber();
    MaxTemp();
    MinTemp();
    print('Current Weather' + '\t' + weatherModel.temp.toString());
    print('Temprature' + '\t' + weatherModel.tempMax.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/homepage1.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Text(
                      city + '\tCurrent Temprature',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Container(
                      height: 300.0,
                      width: double.infinity,
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 40.0,
                              ),
                              Icon(
                                Icons.wb_sunny,
                                size: 30.0,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                city,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    color: Colors.red),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                '$_number°' + '\tC',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1.0,
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 50.0,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Icon(
                                    Icons.whatshot,
                                    color: Colors.amber,
                                    size: 40.0,
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Text(
                                    'High',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Text(
                                    '$_maxTemp°' + '\tC',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 50.0,
                              ),
                              Container(
                                color: Colors.white,
                                height: 150.0,
                                width: 1.0,
                              ),
                              SizedBox(
                                width: 50.0,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Icon(
                                    Icons.cloud,
                                    color: Colors.blue,
                                    size: 40.0,
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Text(
                                    'Low',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Text(
                                    '$_minTemp°' + '\tC',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
