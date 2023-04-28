abstract class MenuComponent {
  void printItem();
}

class MenuCategory implements MenuComponent {
  String name;
  List<MenuComponent> items;

  MenuCategory(this.name, this.items);

  void printItem() {
    print("\n${name}");
    print("-" * name.length);
    for (var item in items) {
      item.printItem();
    }
  }
}

class MenuItem implements MenuComponent {
  String name;
  double price;

  MenuItem(this.name, this.price);

  void printItem() {
    print("${name.padRight(30)}${price.toStringAsFixed(2)}");
  }
}

void main() {
  var menuItem1 = MenuItem("Hamburger", 10.99);
  var menuItem2 = MenuItem("Cheeseburger", 12.99);
  var menuItem3 = MenuItem("Fries", 4.99);
  var menuItem4 = MenuItem("Onion Rings", 5.99);

  var fastFoodMenu =
      MenuCategory("Fast Food", [menuItem1, menuItem2, menuItem3, menuItem4]);

  var menuItem5 = MenuItem("Steak", 20.99);
  var menuItem6 = MenuItem("Salmon", 18.99);
  var menuItem7 = MenuItem("Roast Chicken", 16.99);

  var mainDishMenu =
      MenuCategory("Main Dish", [menuItem5, menuItem6, menuItem7]);

  var menuItem8 = MenuItem("Soda", 2.99);
  var menuItem9 = MenuItem("Iced Tea", 1.99);
  var menuItem10 = MenuItem("Coffee", 2.99);

  var drinksMenu = MenuCategory("Drinks", [menuItem8, menuItem9, menuItem10]);

  var rootMenu =
      MenuCategory("Restaurant Menu", [fastFoodMenu, mainDishMenu, drinksMenu]);

  rootMenu.printItem();
}
