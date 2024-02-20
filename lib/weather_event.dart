part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchWeatcher extends WeatherEvent{
final Position position;

  FetchWeatcher(this.position);
List<Object?> get props => [position];

}
