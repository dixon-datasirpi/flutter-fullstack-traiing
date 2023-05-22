void main() {
  add(5, 10);
  Scopes scopes = Scopes();
  scopes.showTech();
}

// fuctions with  variables;
add(int a, int b) {
  int c;
  c = a + b;
  print(c);
  Flutter flutter = Flutter();
  print(flutter.subtraction(10, 15));
}

// Class with constructor
class Flutter {
   Flutter() {
   }
  subtraction(int a, int b) {
    if (a > b) {
      return a - b;
     } else {
      return "initial value should not be greater";
     }
  }
}

// scopes
class Scopes {
  String globalValue = "this is global string value";
  showTech() {
    const String localVarible = "this is local string value";
    print(globalValue);
    print(localVarible);
  }
}
