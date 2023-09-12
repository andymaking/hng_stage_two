import 'package:flutter/material.dart';
import 'package:hng_stage_two/ediit_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).dividerColor,
          elevation: 0,
          foregroundColor: Colors.black
        )
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  TextEditingController fullNameController = TextEditingController(text: "Andima Udoh");
  TextEditingController userNameController = TextEditingController(text: "andima");
  TextEditingController githubHandleController = TextEditingController(text: "andymaking");
  TextEditingController bioBriefController = TextEditingController(text: "I am Andima Udoh A software engineer extraordinaire looking to hit big in the tech space and be one of the best to ever do it.");

  navigateToEdit(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> EditProfileScreen(fullNameController: fullNameController, userNameController: userNameController, githubHandleController: githubHandleController, bioBriefController: bioBriefController))).whenComplete(() {
      setState(() {

      });
    });
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Portfolio"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextBio(header: "Name", bio: fullNameController.text.trim()),
          TextBio(header: "Username", bio: userNameController.text.trim()),
          TextBio(header: "GitHub Handle", bio: "https://github.com/${githubHandleController.text.trim()}"),
          TextBio(header: "About Me", bio: bioBriefController.text.trim()),
          Buttons( text: "Edit Profile", onTap: ()=> navigateToEdit(context),)
          
        ],
      ),
    );
  }
}

class TextBio extends StatelessWidget {
  final String header;
  final String bio;
  const TextBio({Key? key, required this.header, required this.bio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$header: ", style: headerTextStyle, textAlign: TextAlign.start,),
        const SizedBox(height: 5,),
        Row(
          children: [
            Expanded(child: Text(bio, style: bodyTextStyle)),
          ],
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}


TextStyle headerTextStyle = const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18,);
TextStyle bodyTextStyle = const TextStyle(fontSize: 17, color: Colors.black54
);