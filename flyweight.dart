class Character {
  final String _symbol;

  Character(this._symbol);

  void display(int fontSize) {
    print('$_symbol with font size $fontSize');
  }
}

class CharacterFactory {
  final Map<String, Character> _characters = {};

  Character getCharacter(String symbol) {
    if (_characters.containsKey(symbol)) {
      return _characters[symbol]!;
    } else {
      final character = Character(symbol);
      _characters[symbol] = character;
      return character;
    }
  }
}

class Document {
  final CharacterFactory _characterFactory;

  Document(this._characterFactory);

  void insertCharacter(String symbol, int fontSize) {
    final character = _characterFactory.getCharacter(symbol);
    character.display(fontSize);
  }
}

void main() {
  final characterFactory = CharacterFactory();
  final document = Document(characterFactory);

  document.insertCharacter('A', 12);
  document.insertCharacter('B', 14);
  document.insertCharacter('A', 16);
  print('Avem ${characterFactory._characters.length} obiecte');
}
