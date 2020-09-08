import 'package:flutter/material.dart';
import 'package:flutter_app/adddetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget>createState(){
    return _MyAppState();
  }
}
// This widget is the root of your application.
class _MyAppState extends State<MyApp> {
  static const String _title = 'HOME';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyStatelessWidget(),
    );
  }
}
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState> ();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void openPage(BuildContext context){
  Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            title: const Text('About Us'),
          ),
          body: const Center(
            child: Text(
              'We will make you rich.You make others.'
                  '',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      }
  ));
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Company Homepage'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.person_add),
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(snackBar);
              },
              tooltip: 'Add a member',
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Next page',
              onPressed: () {
              },
            )
          ],
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(30),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey,
              child: IconButton(
                  icon: const Icon(Icons.account_circle),
                  iconSize: 100,
                  tooltip: 'Your Profile',
                  onPressed: () {
                    openSecondPage(context);
                  },

              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey,
              child: IconButton(
                  icon: const Icon(Icons.payment),
                  iconSize: 100,
                  tooltip: 'Payment',
                  onPressed: () {

                  }

              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey,
              child: IconButton(
                  icon: const Icon(Icons.group),
                  iconSize: 100,
                  tooltip: 'My Team',
                  onPressed: () {

                  }

              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey,
              child: IconButton(
                icon: const Icon(Icons.info_outline),
                iconSize: 100,
                tooltip: 'About us',
                onPressed: () {
                  openPage(context);
                },

              ),
            ),
          ],
        )
    );
  }
}
void openSecondPage(BuildContext context){
  Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Profile'),
          ),
          body: Center(
            child: RaisedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddDetailsPage()),
              );
        },
        child: const Text('Add Your Details'),
        ),
        ),
        );
          },

          ),
        );
        }