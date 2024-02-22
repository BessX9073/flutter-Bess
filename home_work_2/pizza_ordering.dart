import 'dart:io';

void main(){
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'veretarian': 6.5,
  };

  const order = ['margherita', 'pepperoni'];

  double total = 0;

  order.forEach((menu){
    if (!pizzaPrices.containsKey(menu)){
      print('$menu pizza is not on the menu');
      exit(1);
    }
    else{
      total += pizzaPrices[menu]!;
    }
  });


  print('Total: \$$total');
}




