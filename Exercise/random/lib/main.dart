import 'dart:async';
import 'dart:math';

Future<int> randomizeNumber() async {
  await Future.delayed(Duration(seconds: 2));

  var random = Random().nextInt(4);

  if (random == 0) {
    throw 'Error you have got 0';
  } else {
    return random;
  }
}

Future<void> main() async {
  print('Start');
  
  try {
    var randomNumber = await randomizeNumber();
    print('End');
    print('Random Number: $randomNumber');
  } catch (error) {
    print(error);
  }
}
