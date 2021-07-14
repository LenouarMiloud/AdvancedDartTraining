import 'dart:async';

int counter = 0;
void main(List<String> arguments) {
  //make the duration
  Duration duration = new Duration(seconds: 2);
  //create the Timer Periodic
  Timer timer = new Timer.periodic(duration, timeout);
  print('Started : ${getTime()}');
}

void timeout(Timer timer){
  print('Timeout : ${getTime()}');

  counter++;
  if (counter >=7) timer.cancel();
}

String getTime(){
  DateTime dateTime = new DateTime.now();

  return dateTime.toString();

}
