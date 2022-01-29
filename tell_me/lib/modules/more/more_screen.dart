import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tell_me/components/card.dart';
import 'package:tell_me/modules/more/more_2_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyCard(
              icon: Ionicons.library_outline,
              colors: const [
                Color(0xFFD2D2D2),
                Color(0xFFFF4C29),
                Color(0xFF87556F),
              ],
              title: 'General',
              image: const DecorationImage( 
                fit: BoxFit.cover,
                image: AssetImage('images/g.jpg'),
              ),
              function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => More2Screen(title: 'general')));
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            MyCard(
              icon: Ionicons.sparkles_outline,
              colors: const [
                Color(0xFFE5E5E5),
                Color(0xFFE3A3B3),
                Color(0xFFDA0037),
              ],
              title: 'Entertainment',
              image:  const DecorationImage( 
                fit: BoxFit.cover,
                image: AssetImage('images/en.png'),
              ),
              function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => More2Screen(title: 'entertainment')));
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            MyCard(
              icon: Ionicons.heart_outline,
              colors: const [
                Colors.green,
                Colors.greenAccent,
                Color(0xFFE5E5E5),
              ],
              title: 'Health',
              image: const DecorationImage( 
                fit: BoxFit.cover,
                image: AssetImage('images/he.jpg'),
              ),
              function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => More2Screen(title: 'health')));
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            MyCard(
              icon: Ionicons.phone_portrait_outline,
              colors: const [
                Color(0xFF610094),
                Color(0xFF3F0071),
                Color(0xFF610094),
                Color(0xFF150050),
              ],
              title: 'Technology',
              image: const DecorationImage( 
                fit: BoxFit.cover,
                image: AssetImage('images/te.jpg'),
              ),
              function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => More2Screen(title: 'technology')));
              },
            ),
          ],
        ),
      ),
    );
  }
}
