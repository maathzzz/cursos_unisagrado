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
        description: "Explore o mundo dos algoritmos, estruturas de dados e engenharia de software",
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
        imgSection1: [
          'assets/labcs4.jpg',
          'assets/labcs5.jpg',
        ],
        imgSection2: [
          'assets/labcs6.jpg',
          'assets/labcs7.jpg',
          'assets/labcs8.jpg',
        ],
        about: "A área de atuação de um profissional de Ciência da Computação abrange a Tecnologia da Informação, que é um mercado em crescimento na atualidade. O cientista da computação poderá atuar em projetos computacionais de hardware e software: projeto de infraestrutura de tecnologia, gerenciamento e bancos de dados, análise de sistemas, segurança da informação e muito mais.",
        benefits: "De olho no futuro e acompanhando as tendências na indústria da informação, pode-se dizer que o mercado de atuação está cada vez mais amplo e exigente, sendo a formação profissional cada vez mais essencial. Grande parte das empresas públicas e privadas utiliza algum tipo de tecnologia para desenvolver suas atividades, necessitando de criação, programação, análise, suporte e inovação."
    ),
    Course(
      name: "Jogos Digitais",
      description: "Projete e desenvolva jogos digitais envolventes e inovadores",
      content: "O curso de Jogos Digitais prepara os estudantes para projetar e desenvolver jogos digitais envolventes e inovadores",
      url: "https://unisagrado.edu.br/graduacao/jogos-digitais",
      degree: "Técnologo",
      modality: "Presencial",
      duration: "2 anos",
      firstCarousel: [
        'assets/labjd1.jpg',
        'assets/labjd2.jpg',
        'assets/labjd3.jpg',
      ],
      imgSection1: [
        'assets/labjd4.jpg',
        'assets/labjd5.jpg',
      ],
      imgSection2: [
        'assets/labjd6.jpg',
        'assets/labcs7.jpg',
        'assets/labcs8.jpg',
      ],
      about: "A principal área de atuação do profissional de Jogos Digitais é o entretenimento digital, em que é responsável pelo desenvolvimento de produtos tais como: jogos educativos, de marketing, de treinamento empresarial, na saúde, científicos, militares, dentre outros. Além disso, pode desempenhar funções como roteirista, artista gráfico, designer de áudio, testador de jogos, programador e redator. As possibilidades são inúmeras!",
      benefits: "O Brasil é o principal mercado de jogos da América Latina e está entre os maiores do mundo. A demanda por profissionais qualificados para o desenvolvimento, gestão e inovação no setor de entretenimento é crescente. Além disso, setores como educação, treinamento profissional e marketing estão cada vez mais interessados nas habilidades do tecnólogo em Jogos Digitais. Profissionais atualizados com as novidades do mercado, criativos e inovadores têm um futuro promissor."
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
        selectedItemColor: Colors.red,
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
            Text("Professor: Prof. Dr. Elvio Gilberto da Silva", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
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
            SizedBox(height: 5),
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
      elevation: 2,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Icon(Icons.school, size: 30, color: Colors.red),
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
        child: SingleChildScrollView(
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
                          borderRadius: BorderRadius.circular(10),
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
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade700,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sobre o Curso', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white)),
                    SizedBox(height: 8),
                    Text(course.about, textAlign: TextAlign.justify, style: const TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: course.imgSection1.map((imagePath) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 200,
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Benefícios do Curso', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      course.benefits,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text('Conheça o ambiente:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: course.imgSection2.map((imagePath) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 200,
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => _launchURL(Uri.parse(course.url)),
                  child: Text('Veja mais sobre o curso', style: TextStyle(color: Colors.red)),
                ),
              ),
              const SizedBox(height: 20),
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
  final String about;
  final List<String> imgSection1;
  final List<String> imgSection2;
  final String benefits;


  Course({
    required this.name,
    required this.description,
    required this.content,
    required this.url,
    required this.degree,
    required this.modality,
    required this.duration,
    required this.firstCarousel,
    required this.about,
    required this.imgSection1,
    required this.imgSection2,
    required this.benefits,
  });
}
