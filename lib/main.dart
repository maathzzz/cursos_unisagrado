import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unisagrado - Cursos de Tecnologia Superior com Excelência',
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
      description: "Explore the depths of algorithms, data structures and software engineering.",
      content:
      "O curso de Ciência da Computação é ideal para quem deseja aprofundar-se em algoritmos, estruturas de dados e engenharia de software...",
      url: "https://unisagrado.edu.br/graduacao/ciencia-da-computacao",
    ),
    Course(
      name: "Jogos Digitais",
      description: "Design and develop engaging and innovative digital games.",
      content: "O curso de Jogos Digitais prepara os estudantes para projetar e desenvolver jogos digitais envolventes e inovadores...",
      url: "https://unisagrado.edu.br/graduacao/jogos-digitais",
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
        title: Text('Unisagrado - Cursos de Tecnologia'),
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
    return Center(
      child: Text('Rocky'),
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
        /* title: Text(course.name), */
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(course.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(course.content, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchURL(Uri.parse(course.url)),
              child: Text('Veja mais sobre o curso'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Course {
  final String name;
  final String description;
  final String content;
  final String url;

  Course({required this.name, required this.description, required this.content, required this.url});
}
