import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:laws_transport/ui/questions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  final images = [
    'https://i.ytimg.com/vi/Vm6qvXGcadY/maxresdefault.jpg',
    'https://xabar.uz/static/crop/8/6/920__95_861035441.jpg',
    'https://storage.kun.uz/source/8/Qh2h4mkwFbuc-sCBjj4NJw23J-5TLqlm.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen",
          style: TextStyle(
              fontSize: 27, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                // final urlImage = images[index];
                return buildImage(images[index]);
              },
              options: CarouselOptions(
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  height: 200)),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return QuestionsPage();
                },
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/savol.jpg')),
                  border: Border.all(
                      color: const Color.fromARGB(255, 196, 192, 192)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 4,
                        blurRadius: 4,
                        color: Color.fromARGB(255, 208, 204, 204))
                  ]),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 200,
            ),
          )
        ],
      ),
    );
  }

  Widget buildImage(String urlImage) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
