import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      routes: <String, WidgetBuilder>{
        "/SecondPage": (BuildContext context) => new SecondPage(),
        "/ThirdPage": (BuildContext context) => new ThirdPage(),
        "/FourthPage":  (BuildContext context) => new FourthPage(),
      }
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State  createState() => new LoginPageState();
}
  
class LoginPageState extends State<LoginPage>{
@override 
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor:Colors.deepOrange ,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/house.png") ,
            fit: BoxFit.cover,
            color:Colors.black87 ,
            colorBlendMode:BlendMode.lighten,
          ),
          new Column(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: <Widget>[
              new FlutterLogo(
                size: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom:8.0,  ),
                child: new MaterialButton(
                  color: Colors.teal,
                  textColor: Colors.white54,
                  child: new Text("LOGIN"),
                  onPressed:() {Navigator.of(context).pushNamed("/SecondPage");}
                ),
              ),
              new MaterialButton(
                color: Colors.teal,
                textColor: Colors.white54,
                child: new Text("SIGNUP"),
                onPressed:()  {Navigator.of(context).pushNamed("/ThirdPage");} 
              ),
            ],
          )
        ],
      ),
    );
  }
}
  




class SecondPage extends StatefulWidget {
  final Widget child;

  SecondPage({Key key, this.child}) : super(key: key);

  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SIGNUP PAGE") ,
        backgroundColor: Colors.deepOrange,
      ) ,
      body:new Container(
        child:new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: <Widget>[
              new FlutterLogo(
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0, bottom: 5.0, ),
                child: new TextFormField(
                  validator:(value) => value.isEmpty ? "name can\'t be empty" :null,
                  decoration:new InputDecoration(
                    labelText: "NAME",
                    hintText: "surname/firstname/lastname",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ) ,
                  ) ,
                  keyboardType:TextInputType.emailAddress,
                ),
              ),
               new TextFormField(
                 autovalidate:true ,
                 validator:(value) => value.isEmpty ? "Email can\'t be empty" :null,
                decoration:new InputDecoration(
                  labelText: "EMAIL",
                  hintText: "future312@gmail.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(70.0),
                  ) ,
                ) ,
                keyboardType:TextInputType.text,
               ),
               new TextFormField(
                  autovalidate:true ,
                 validator:(value) => value.isEmpty ? "password can\'t be empty" :null,
                decoration:new InputDecoration(
                  labelText: "PASSWORD",
                  hintText: "YTD5463575GTF4G75",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(70.0),
                  ) ,
                ) ,
                keyboardType:TextInputType.text,
                obscureText:true ,
               ),
               SizedBox(height:10.0 ,),
               Container(
                 padding: EdgeInsets.only(top:10.0, left:20.0 , ) ,
                 child: InkWell(
                   child: Text('Forgot Password',
                   style: TextStyle(
                     color: Colors.deepOrange,
                     fontWeight: FontWeight.bold,
                   ),
                   ) ,
                 ),
               ),
               Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom:8.0,  ),
                child: new MaterialButton(
                  color: Colors.deepOrange,
                  textColor: Colors.white54,
                  child: new Text("LOGIN"),
                  onPressed:() => {}
                ),
              ),
            ],
        ) ,
             ] ,
    )
    )
      )
    );
  }
}
class ThirdPage extends StatefulWidget {
  final Widget child;

  ThirdPage({Key key, this.child}) : super(key: key);

  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final formKey = new GlobalKey <FormState>();
String _email;
String _password;
  void validateAndSave(){
final form =formKey.currentState;
if (form.validate()){
  print("form is valid. Email: $_email, password: $_password " );
} else {
  print('form is invalid.Email: $_email, password: $_password');
  }
  }

  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
        title: new Text("LOGIN PAGE") ,
        backgroundColor: Colors.deepOrange,
      ) ,
      body:new Container(
        child:new Center(
          child: new Column(
            key: formKey ,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: <Widget>[
              new FlutterLogo(
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0, bottom: 10.0, ),
                child: new TextFormField(
                   autovalidate:true ,
                  validator:(value) => value.isEmpty ? "Email can\'t be empty" :null,
                  onSaved: (value) => _email =value,
                  decoration:new InputDecoration(
                    labelText: "EMAIL",
                    hintText: "future312@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ) ,
                  ) ,
                  keyboardType:TextInputType.emailAddress,
                ),
              ),
               new TextFormField(
                  autovalidate:true ,
                 validator:(value) => value.isEmpty ? "password can\'t be empty" :null,
                  onSaved: (value) => _password =value,
                decoration:new InputDecoration(
                  labelText: "PASSWORD",
                  hintText: "YTD5463575GTF4G75",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ) ,
                ) ,
                keyboardType:TextInputType.text,
                obscureText:true ,
               ),
               SizedBox(height:10.0 ,),
               Container(
                 padding: EdgeInsets.only(top:10.0, left:20.0 , ) ,
                 child: InkWell(
                   child: Text('Forgot Password',
                   style: TextStyle(
                     color: Colors.deepOrange,
                     fontWeight: FontWeight.bold,
                   ),
                   ) ,
                 ),
               ),
               Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom:8.0,  ),
                child: new MaterialButton(
                  color: Colors.deepOrange,
                  textColor: Colors.white54,
                  child: new Text("LOGIN"),
                  onPressed:() {Navigator.of(context).pushNamed("/FourthPage");}
                ),
              ),
            ],
        ) ,
             ] ,
    )
    )
    )
    );
}
}

class FourthPage extends StatefulWidget {
  final Widget child;

  FourthPage({Key key, this.child}) : super(key: key);

  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
        title: new Text("DRAWER PAGE") ,
        backgroundColor: Colors.deepOrange,
      ) ,
      drawer: new Drawer(
        
     child: new ListView(
       children: <Widget>[
         new UserAccountsDrawerHeader(
           accountName:new Text("FUTUREALEX"),
           accountEmail: new Text("futurealex551@gmail.com"),
           currentAccountPicture: new CircleAvatar(
              backgroundColor:Colors.orange ,
              child: new Text("F") ,
           ) ,
         ),
         new ListTile(
           title: new Text("CART"),
           leading: new Icon(Icons.add_shopping_cart),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("FAVORITE"),
           leading: new Icon(Icons.favorite),
            onTap: () => Navigator.of(context).pop(),
         ),
        new ListTile(
           title: new Text("BUSINESS"),
           leading: new Icon(Icons.business),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("LOCATION"),
           leading : new Icon(Icons.location_on),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("MESSAGE"),
           leading: new Icon(Icons.message),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("NAVIGATION"),
           leading: new Icon(Icons.navigation),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("WIFI"),
           leading: new Icon(Icons.wifi),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("CART"),
           leading: new Icon(Icons.add_shopping_cart),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("VOICE CHAT"),
           leading : new Icon(Icons.voice_chat),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("VIDEO CALL"),
           leading: new Icon(Icons.videocam),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("UPDATES"),
           leading: new Icon(Icons.update),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("TIMER"),
           leading: new Icon(Icons.timer),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("CAMERA SWITCHING"),
           leading: new Icon(Icons.switch_camera),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("VIDEO SWITCHING"),
           leading: new Icon(Icons.switch_video),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("AGENT ACCOUNT"),
          leading: new Icon(Icons.supervisor_account),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("MAP"),
           leading: new Icon(Icons.map),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("CLOSEST AGENT"),
           leading: new Icon(Icons.local_offer),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("HOTEL"),
           leading: new Icon(Icons.local_hotel),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("LANGUAGE"),
           leading :new Icon(Icons.language),
            onTap: () => Navigator.of(context).pop(),
         ),
         new ListTile(
           title: new Text("CONTACTS"),
           leading: new Icon(Icons.import_contacts),
            onTap: () => Navigator.of(context).pop(),
         ),
       ],
    )
      )
    );
}
}