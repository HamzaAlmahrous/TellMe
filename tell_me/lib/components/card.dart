import "package:flutter/material.dart";

class MyCard extends StatelessWidget {
  late String title;
  late IconData icon;
  late List<Color> colors;
  late Function()? function;
  late DecorationImage? image;

  MyCard({
    required this.icon,
    required this.colors,
    required this.title,
    required this.function,
    this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsetsDirectional.only(top: 10.0, bottom: 10.0),
        width: double.infinity / 2,
        height: 130.0,
        child: FlatButton(
          onPressed: function,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Icon(
                    icon,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Container(
                width: double.infinity,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: image,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: -24.0,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            tileMode: TileMode.mirror,
            transform: GradientRotation(20.0),
          ),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: -24.0,
              blurRadius: 5.0,
            ),
            BoxShadow(
              color: Colors.grey,
              spreadRadius: -24.0,
              blurRadius: 24.0,
            ),
            BoxShadow(
              color: Colors.black,
              spreadRadius: 1.0,
              blurRadius: 10.0,
              offset: Offset(-0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
