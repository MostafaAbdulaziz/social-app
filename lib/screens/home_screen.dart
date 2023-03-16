
import 'package:flutter/material.dart';
int currentIndex=0;
// List<Widget> screens=[
//   const ProductScreen(),
//   const CategoriesScreen(),
//   const FavouriteScreen(),
//   const SettingScreen(),
// ];
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: const Color.fromRGBO(125, 210, 146 , 1),
        onTap: (index){
          setState(() {
            currentIndex=index;
            print(currentIndex);
          });
        },

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits,),
            label: 'Product'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category,),
              label: 'Categories'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits,),
              label: 'Favorite'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,),
              label: 'Setting'
          ),
        ],

        currentIndex:currentIndex ,
        type: BottomNavigationBarType.fixed,

        selectedItemColor:Colors.white ,
        selectedLabelStyle:const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ) ,
        selectedIconTheme:const IconThemeData(
          size: 25
        ) ,

        unselectedItemColor:Colors.black ,
        unselectedLabelStyle:const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold
        ) ,
        unselectedIconTheme:const IconThemeData(
            size: 20
        ) ,


      ),
      //body:screens[currentIndex] ,
    );
  }
}
