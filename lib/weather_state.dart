part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {

}
class WeatherBlocLoading extends WeatherState {

}
class WeatherBlocFailure extends WeatherState {

}
class WeatherBlocSucess extends WeatherState {
  final Weather weather;

  WeatherBlocSucess(this.weather);
  // TODO: implement props
  List<Object?> get props => [weather];

}
