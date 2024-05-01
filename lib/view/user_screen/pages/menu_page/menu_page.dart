import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: const Column(
            children: [
              Text(
                'About',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              ),
              SizedBox(
                width: 219,
                height: 219,
                child: Image(
                  image: AssetImage('lib/assets/sukify_logo_colored.png'),
                ),
              ),
              Text(
                'Introduction',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, .7)),
              ),
              SizedBox(height: 5),
              Text(
                '   Introducing “SukiFy” an e-commerce apparel store, comes from a combination of Tagalog word “suki” and an English suffix “-fy” which mean “a regular customer” and “to become” respectively, hence, to make regular clients.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, .5)),
              ),
              SizedBox(height: 20),
              Text(
                'Mission',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, .7)),
              ),
              SizedBox(height: 5),
              Text(
                '   The app is designed to provide the various needs of consumers with its user-friendly interface and seamless search function.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, .5)),
              ),
              SizedBox(height: 20),
              Text(
                'Vision',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, .7)),
              ),
              SizedBox(height: 5),
              Text(
                '   To be the go-to fashion destination for consumers who like to rock the day with a confidence influenced by style.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, .5)),
              ),
              SizedBox(height: 20),
              Text(
                'Developers',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, .7)),
              ),
              SizedBox(height: 5),
              Text(
                'Juan Miguel Catalan | UI/UX',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, .5)),
              ),
              Text(
                'Felizardo Arrabis Jr. | Frontend',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, .5)),
              ),
              Text(
                'John Christian Bernal | Backend',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, .5)),
              ),
              Text(
                'Aliyah Nicole Policarpio | QA',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, .5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
