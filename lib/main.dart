import 'package:flutter/material.dart';
import 'package:swagger/api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    fetchStuff();

    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void fetchStuff() {
    fetchPets();
    fetchStoreInventory();
    fetchUser();
  }

  void fetchPets() {
    print('fetching pets by status...');
    var statuses = new List<String>();
    statuses.add('available');
    new PetApi(defaultApiClient)
        .findPetsByStatus(statuses)
        .then((List<Pet> pets) {
      print('pets received: ');
      print(pets);
      var order = new Order();
      order.petId = pets[0].id;
      order.quantity = 1;
      new StoreApi(defaultApiClient)
          .placeOrder(order)
          .then((Order order) => print(order));
    }).catchError((error) {
      print('error fetching pets');
      print(error);
    });
  }

  void fetchStoreInventory() {
    print('fetching inventory...');
    new StoreApi(defaultApiClient)
        .getInventory()
        .then((Map<String, int> inventory) {
      print('inventory received: ');
      print(inventory);
    }).catchError((error) {
      print('error fetching inventory');
      print(error);
    });
  }

  void fetchUser() {
    print('fetching user1...');
    new UserApi(defaultApiClient).getUserByName('user1').then((User user) {
      print('user received: ');
      print(user);
    }).catchError((error) {
      print('error fetching user');
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
