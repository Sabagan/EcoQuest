import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 252, 233),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Back")
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => print("Toggle light/dark mode"), 
                  child: Text("Light/Dark Mode Button")
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.black,
                      child: Text("Day", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.white,
                      child: Text("Hour", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 24,),
            Container(
              height: 125,
              width: 125,
              color: Colors.black38,
              child: Align(alignment: Alignment.center, child: Text("Image goes here")),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Title That Could Possible Be Very Long Goes Here", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Description that could even more possibly be pretty long goes here", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),),
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder()
                ),
                onPressed: () => print("Roll challenges"),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Roll Challenges", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder()
                ),
                onPressed: () => print("List Of Challenges"),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("List Of Challenges", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder()
                ),
                onPressed: () => print("Previous Challenges"),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Previous Challenges", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}