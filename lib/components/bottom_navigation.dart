import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return BottomNavigationBar(
         showUnselectedLabels: true,
         showSelectedLabels: true,
         selectedItemColor: Colors.black,
         unselectedItemColor: Colors.black,
         items:const[
           BottomNavigationBarItem(
              label: "Home",

               icon: Icon(Icons.home,color: Colors.blue,)

           ),
           BottomNavigationBarItem(
               label: "Add card",
               icon: Icon(Icons.credit_card,color: Colors.blue,)
           ),
           BottomNavigationBarItem(
               label: "News",
               icon: Icon(Icons.newspaper,color: Colors.blue,)
           ),
           BottomNavigationBarItem(
               label: "Profile",
               icon: Icon(Icons.person_2_outlined,color: Colors.blue,)
           ),
         ]
     );




    //Container(
    //   height: 70,
    //   color: Colors.blue[50],
    //   width: MediaQuery.of(context).size.width,
    // );

  }
}
