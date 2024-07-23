import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  static const images = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg',
    'images/image7.jpg',
    'images/image8.jpg',
    'images/image9.jpg',
  ];
  const ExampleApp({super.key}); 

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  static const _defaultAnimDuration = Duration(milliseconds: 300);

  late var currentPage = ExampleApp.images.length ~/ 2;

  late final _pageController = PageController(
    /// Начальным элементом будет средний элемент списка
    initialPage: currentPage,

    /// Отвечает за то, сколько пространства PageView занимает активный элемент.
    /// По умолчанию равно 1, что означает, что элемент занимает все пространство.
    ///
    /// Выставив такое значение, мы сможем увидеть соседние элементы.
    viewportFraction: 0.6,
  );

  @override
  void initState() {
    /// С этого момента при любом изменении, произошедшем в PageController,
    /// будет вызвать метод _onPageChanged
    _pageController.addListener(_onPageChanged);
    super.initState();
  }

  @override
  void dispose() {
    /// Не забываем "отписать" нашего слушателя от контроллера и
    /// освободить ресурсы, выделенные под него.
    _pageController
      ..removeListener(_onPageChanged)
      ..dispose();
    super.dispose();
  }

  /// Здесь мы будем реагировать на изменение текущего положения в рамках PageView
  void _onPageChanged() {
    /// Запоминаем последнюю активную страницу
    final prevPage = currentPage;

    /// Вычисляем текущую (или, вернее, вычисляем страницу, к которой мы ближе всего)
    currentPage = _pageController.page?.round() ?? currentPage;

    /// Если наша страница изменилась, делаем setState, чтобы вызвать перестройку виджета
    if (prevPage != currentPage) setState(() {});
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text('Date'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '${currentPage + 1}/${ExampleApp.images.length}',
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: ExampleApp.images.length,
          itemBuilder: (_, i) => Center(
            /// Используем виджет неявной анимации, чтобы достичь
            /// красивого эффекта плавного масштабирования
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),

              /// Если страница является текущей, её масштаб будет оригинальным (1),
              /// иначе - чуть меньше
              scale: currentPage == i ? 1 : 0.7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  /// Теперь при нажатии на определенный элемент мы с помощью
                  /// PageController перемещаться к нему
                  onTap: () => _pageController.animateToPage(
                    i,
                    duration: _defaultAnimDuration,
                    curve: Curves.easeIn,
                  ),
                  child: _PageViewItem(image: ExampleApp.images[i]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PageViewItem extends StatelessWidget {
  final String image; 
  const _PageViewItem({ 
    required this.image, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        height: 600,
        width: 312,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
