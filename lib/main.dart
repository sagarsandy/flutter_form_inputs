import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter All Inputs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String name, email, bio, gender, password;
  int age;
  bool isGraduated = false;
  bool isEducated = false;
  List<bool> genderTypes = [false, false, false];
  List<String> genderTypesValue = ["male", "female", "trans"];

  @override
  void initState() {
    super.initState();
  }

  // Clear all form fields value to default
  resetForm() {
    emailController.text = '';
    nameController.text = '';
    ageController.text = '';
    bioController.text = '';
    passwordController.text = '';
    setState(() {
      isEducated = false;
      isGraduated = false;
      genderTypes = [false, false, false];
    });
  }

  // Function to validate input form
  validate() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      print("Email is : $email");
      print("Password is : $password");
      print("Name is : $name");
      print("Age is : $age");
      print("Bio is : $bio");
      print("Is Educated : $isEducated");
      print("Is Graduated : $isGraduated");
      print("Gender is : $gender");
      resetForm();
    }
  }

  // Input form widget
  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 15),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "eg: John",
                      errorStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.orangeAccent,
                      )),
                  validator: (val) =>
                      val.length == 0 ? "Please Enter Name" : null,
                  onSaved: (val) => name = val,
                ),
              ),
              Text(
                "Email",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 5, top: 1),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "eg: abc@gmail.com",
                        hintStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      validator: (val) =>
                          val.length == 0 ? "Please Enter Email" : null,
                      onSaved: (val) => email = val,
                    ),
                  ),
                ),
              ),
              Text(
                "Password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 5, top: 1),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "******",
                        hintStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      validator: (val) => val.length < 5
                          ? "Password should be more than 5 characters"
                          : null,
                      onSaved: (val) => password = val,
                    ),
                  ),
                ),
              ),
              Text(
                "Age",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                child: TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "eg: 22",
                  ),
                  validator: (val) =>
                      val.length == 0 ? "Please Enter Age" : null,
                  onSaved: (val) => age = int.parse(val),
                ),
              ),
              Text(
                "Bio",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 5, top: 0),
                    child: TextFormField(
                      controller: bioController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "eg: hello guys",
                        hintStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      onSaved: (val) => bio = val,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Educated",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Checkbox(
                    value: isEducated,
                    onChanged: (value) {
                      FocusScope.of(context)
                          .requestFocus(FocusNode()); // To hide keyboard
                      setState(() {
                        isEducated = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Graduated",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Switch(
                    value: isGraduated,
                    onChanged: (value) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        isGraduated = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  ToggleButtons(
                    borderColor: Colors.lightBlue[100],
                    fillColor: Colors.lightBlue[100],
                    selectedColor: Colors.white,
                    selectedBorderColor: Colors.lightBlue[100],
                    borderWidth: 4,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text("Male"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text("Female"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text("Trans"),
                      ),
                    ],
                    isSelected: genderTypes,
                    onPressed: (int index) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        genderTypes = [false, false, false];
                        genderTypes[index] = true;
                        gender = genderTypesValue[index];
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: validate,
                    child: Text('ADD'),
                    elevation: 10,
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      resetForm();
                    },
                    elevation: 7,
                    child: Text('RESET'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              form(),
            ],
          ),
        ),
      ),
    );
  }
}
