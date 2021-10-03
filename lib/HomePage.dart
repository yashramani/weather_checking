import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherchecking/ShowWeather.dart';
import 'package:weatherchecking/WeatherReport.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherReport weatherReport = WeatherReport();
  TextEditingController cityName = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Image.asset(
                'assets/homepage1.jpg',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(),
                    ),
                    Form(
                        key: _key,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: cityName,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          style: BorderStyle.solid)),
                                  labelText: 'City Name',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  hintText: 'Enter City Name',
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter City Name';
                                }
                              },
                            )
                          ],
                        )),
                    InkWell(
                      onTap: () {
                        if (cityName.text.isEmpty) {
                          if (_key.currentState.validate()) {}
                        } else {
                          // weatherReport.getWeather(cityName.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ShowWeather(cityName.text)));
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.black38,
                                Colors.black12
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text(
                            'Search Weather',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        onWillPop: () {
          exit(0);
        });
  }
}
