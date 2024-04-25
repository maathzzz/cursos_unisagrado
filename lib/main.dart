import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unisagrado - Cursos de Tecnologia Superior com Excelência',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Course> courses = [
    Course(
      name: "Ciência da Computação",
      description: "Explore the depths of algorithms, data structures and software engineering.",
      content:
          "O curso de Ciência da Computação é ideal para quem deseja aprofundar-se em algoritmos, estruturas de dados e engenharia de software. Nele, os estudantes aprendem a desenvolver algoritmos complexos e a utilizar diversas estruturas de dados para processamento eficiente de informações. Além disso, o curso enfatiza a engenharia de software, preparando os alunos para projetar, desenvolver, testar e manter softwares de qualidade. Com um equilíbrio entre teoria e prática, o curso prepara os futuros profissionais para liderar inovações tecnológicas em um mundo cada vez mais dependente da computação.",
      url: "https://unisagrado.edu.br/graduacao/ciencia-da-computacao",
    ),
    Course(
      name: "Jogos Digitais",
      description: "Design and develop engaging and innovative digital games.",
      content: "O curso de Jogos Digitais prepara os estudantes para projetar e desenvolver jogos digitais envolventes e inovadores. Focando em design de jogos, programação, design gráfico, animação e sonorização, o programa oferece uma formação abrangente nos aspectos técnicos e criativos da criação de jogos. Os alunos aprendem a integrar narrativas envolventes e personagens memoráveis, enquanto exploram novas tecnologias e técnicas de gameplay. Com uma forte ênfase em projetos práticos, o curso visa desenvolver habilidades e uma mentalidade de inovação, preparando os graduados para uma carreira dinâmica na indústria de jogos digitais.",
      url: "https://unisagrado.edu.br/graduacao/jogos-digitais",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unisagrado - Cursos de Tecnologia'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseCard(course: courses[index]);
        },
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
          color: Colors.grey,
        ),
        title: Text(course.name),
        subtitle: Text(course.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseDetailPage(course: course)),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey,
            ),
            SizedBox(height: 8),
            Text(course.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(course.content, style: TextStyle(fontSize: 16)),
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
