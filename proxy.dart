abstract class Resource {
  void accessResource(String user);
}

class ProtectedResource implements Resource {
  @override
  void accessResource(String user) {
    print('$user is accessing the protected resource.');
  }
}

class AuthenticationProxy implements Resource {
  final Resource _resource;

  AuthenticationProxy(this._resource);

  void accessResource(String user) {
    if (authenticateUser(user)) {
      _resource.accessResource(user);
    } else {
      print('Access denied. User is not authenticated.');
    }
  }

  bool authenticateUser(String user) {
    return user == 'john';
  }
}

void main() {
  final resource = ProtectedResource();
  final proxy = AuthenticationProxy(resource);

  proxy.accessResource('john');
  proxy.accessResource('jane');
}
