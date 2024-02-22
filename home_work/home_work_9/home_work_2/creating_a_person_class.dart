class Person {
  String name = '';
  int age = 0;
  double height = 0;

  Person(String name, int age, double height) {
    this.name = name;
    this.age = age;
    this.height = height;
  }

  void printDescription() {
    print("My name is ${this.name}. I'm ${this.age} years old, I'm ${this.height} meters tall.");
  }
}

void main() {
  var son = Person('Son Heung Min', 31, 183);
  var roanldo = Person('Cristiano Ronaldo', 38, 187);
  son.printDescription();
  roanldo.printDescription();
}
