import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled12/weather_bloc.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2, 40, 20),
        child: BlocBuilder<WeatherBloc, WeatherState>(
  builder: (context, state) {
    if(state is WeatherBlocSucess) {
      return SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(3, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-3, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFF673AB7),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -1.2),
              child: Container(
                height: 300,
                width: 600,
                decoration: BoxDecoration(
                  color: Color(0xFFFFAB40),

                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${state.weather.areaName}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    'Good Morning',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Image.asset('assets/images/cloud3.png'),
                   Center(
                    child: Text('${state.weather.temperature!.celsius!.round()}°C', style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 45),),
                  ),
                   Center(
                    child: Text('${state.weather.weatherMain!.toUpperCase()}', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 25),),
                  ),
                   Center(
                    child: Text(
                      DateFormat('EEEE dd .').add_jm().format(state.weather.date!)
                      , style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),),
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/sun.jpg', height: 36,),
                          Column(
                            children: [
                              Text('Sunrise', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),),
                              Text(
                                DateFormat().add_jm().format(state.weather.sunrise!)
                                , style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/sun.jpg', height: 36,),
                          Column(
                            children: [
                              Text('Sunset', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16),),
                              Text(
                                DateFormat().add_jm().format(state.weather.sunset!)

                                , style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16),),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Divider(
                      color: Colors.grey,
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/sun.jpg', height: 36,),
                          Column(
                            children: [
                              Text('Temp Max', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),),
                              Text(
                                '${state.weather.tempMax!.celsius!.round().toString()} °C', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/sun.jpg', height: 36,),
                          Column(
                            children: [
                              Text('Temp Min', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16),),
                              Text(
                                  '${state.weather.tempMin!.celsius!.round().toString()} °C'
                              , style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16),),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                ],
              ),

            )
          ],
        ),
      );
    }else{
      return Container();
    }
  },
),
      ),
    );
  }
}
