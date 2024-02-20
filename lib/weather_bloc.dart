import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:untitled12/data/my_data.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatcher>((event, emit) async{
      emit(WeatherBlocLoading());
      try{
        WeatherFactory wf = WeatherFactory(API_KEY,language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(event.position.latitude, event.position.longitude);
        print(weather);
        emit(WeatherBlocSucess(weather));
      }catch(e){
        emit(WeatherBlocFailure());
      }
    });
  }
}
