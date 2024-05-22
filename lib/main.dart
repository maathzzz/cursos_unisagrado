import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unisagrado Tech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Course> courses = [
    Course(
      name: "Ciência da Computação",
      description: "Explore o mundo dos algoritmos, estruturas de dados e engenharia de software.",
      content: "O curso de Ciência da Computação é ideal para quem deseja aprofundar-se em algoritmos, estruturas de dados e engenharia de software",
      url: "https://unisagrado.edu.br/graduacao/ciencia-da-computacao",
      degree: "Bacharelado",
      modality: "Presencial",
      duration: "4 anos",
      firstCarousel: [
        'assets/labcs1.jpg',
        'assets/labcs3.jpg',
        'assets/labcs4.jpg',
      ],
    ),
    Course(
      name: "Jogos Digitais",
      description: "Design and develop engaging and innovative digital games.",
      content: "O curso de Jogos Digitais prepara os estudantes para projetar e desenvolver jogos digitais envolventes e inovadores...",
      url: "https://unisagrado.edu.br/graduacao/jogos-digitais",
      degree: "Técnologo",
      modality: "Presencial",
      duration: "2 anos",
      firstCarousel: [
        'assets/labcs1.jpg',
        'assets/labcs3.jpg',
        'assets/labcs4.jpg',
      ],
    ),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getPageWidget(int index) {
    switch (index) {
      case 0:
        return ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return CourseCard(course: courses[index]);
          },
        );
      case 1:
        return InfoPage();
      default:
        return const Text('Page not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unisagrado Tech'),
      ),
      body: _getPageWidget(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Cursos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Informações',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text("Disciplina: Desenvolvimento de Software", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            SizedBox(height: 10),
            Text("Professor: Prof. Dr. Élvio Gilberto da Silva", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            SizedBox(height: 10),
            Divider(
              height: 20,
              thickness: 1,
              indent: 30,
              endIndent: 30,
              color: Colors.grey,
            ),
            Text("Integrantes:", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            SizedBox(height: 10),
            Text("Lucas Antonio Pires de Souza", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            Text("Matheus de Amorim Favero", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            SizedBox(height: 10),
            Divider(
              height: 20,
              thickness: 1,
              indent: 30,
              endIndent: 30,
              color: Colors.grey,
            ),
            SizedBox(height: 15),
            Text("Desenvolvimento:", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo_cc.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
              ],
            ),
            SizedBox(height: 15),
            Text("Apoio:", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo_ce.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;

  CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Container(
          width: 100,
          height: 56,
          color: Colors.red,
        ),
        title: Text(course.name),
        subtitle: Text(course.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseDetailPage(course: course),
            ),
          );
        },
      ),
    );
  }
}

class CourseDetailPage extends StatelessWidget {
  final Course course;

  CourseDetailPage({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Center(
                child: Text(course.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
              const SizedBox(height: 8),
              Text(course.content, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildInfoCard(Icons.school, course.degree),
                    const SizedBox(width: 16),
                    _buildInfoCard(Icons.person, course.modality),
                    const SizedBox(width: 16),
                    _buildInfoCard(Icons.calendar_month, course.duration),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(height: 200.0, autoPlay: true),
                items: course.firstCarousel.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _launchURL(Uri.parse(course.url)),
                child: Text('Veja mais sobre o curso'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String text) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red.shade700,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 25, color: Colors.white),
          Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }
}


  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

class Course {
  final String name;
  final String description;
  final String content;
  final String url;
  final String degree;
  final String modality;
  final String duration;
  final List<String> firstCarousel;

  Course({
    required this.name,
    required this.description,
    required this.content,
    required this.url,
    required this.degree,
    required this.modality,
    required this.duration,
    required this.firstCarousel,
  });
}

