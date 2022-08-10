import 'package:flutter/material.dart';


class Home extends StatelessWidget {
    Map received = {};
  @override
  Widget build(BuildContext context) {
    received  = ModalRoute.of(context)!.settings.arguments as Map;
    print(received);
    // received = data;
    print("build run: Home");

    String bgImage = received['isDayTime']? 'day.png': 'night.png';
    Color? bgColor = received['isDayTime']?  Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10,180,10,0),
                child: TextButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    received["location"],
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                received['time'],
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
