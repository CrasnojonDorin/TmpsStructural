abstract class Pizza {
  String getDescription();
  double getCost();
}

class BasicPizza implements Pizza {
  @override
  String getDescription() {
    return "Thin dough";
  }

  @override
  double getCost() {
    return 10.0;
  }
}

class PizzaDecorator implements Pizza {
  Pizza? _pizza;

  PizzaDecorator(Pizza pizza) {
    _pizza = pizza;
  }

  @override
  String getDescription() {
    return _pizza!.getDescription();
  }

  @override
  double getCost() {
    return _pizza!.getCost();
  }
}

class ExtraCheese extends PizzaDecorator {
  ExtraCheese(Pizza pizza) : super(pizza);

  @override
  String getDescription() {
    return "${super.getDescription()}, extra cheese";
  }

  @override
  double getCost() {
    return super.getCost() + 2.0;
  }
}

void main() {
  Pizza basicPizza = BasicPizza();
  print(
      "Basic pizza: ${basicPizza.getDescription()} - ${basicPizza.getCost()}");

  Pizza pizzaWithExtraCheese = ExtraCheese(basicPizza);
  print(
      "Pizza with extra cheese: ${pizzaWithExtraCheese.getDescription()} - ${pizzaWithExtraCheese.getCost()}");
}
