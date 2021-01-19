part of 'models.dart';

class Moisture extends Equatable {
  String now;

  Moisture(this.now);
  @override
  List<Object> get props => [now];
}