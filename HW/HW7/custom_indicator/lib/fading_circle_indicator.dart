import 'package:flutter/material.dart';
import 'dart:math' as math;

class FadingCircleIndicator extends StatefulWidget {
  final double size;
  const FadingCircleIndicator({
    Key? key,
    this.size = 80.0,
  }) : super(key: key);

  @override
  State<FadingCircleIndicator> createState() => _FadingCircleIndicatorState();
}

class _FadingCircleIndicatorState extends State<FadingCircleIndicator>
    with SingleTickerProviderStateMixin {
  // create quantity of elements
  static const _itemCount = 8;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = (AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800)))
      ..repeat();
    //_initColorAnimation();
  }

  final List<Color> _dotColors = [
    const Color.fromARGB(255, 172, 13, 2),
    const Color.fromARGB(255, 224, 96, 11),
    const Color.fromARGB(255, 217, 203, 10),
    const Color.fromARGB(255, 43, 129, 0),
    const Color.fromARGB(255, 4, 174, 189),
    const Color.fromARGB(255, 9, 6, 194),
    const Color.fromARGB(255, 128, 8, 118),
    const Color.fromARGB(255, 176, 39, 121),
  ];
  //AnimationController:
  //vsync - обеспечивает плавный и эффективный рендеринг анимации за счет синхронизации частоты кадров анимации с частотой обновления дисплея устройства.
  //vsync: this - SingleTickerProviderStateMixin
// Duration - время анимации
  // void _initColorAnimation() {
  //   double endAnimation = 1.0 / _itemCount;

  //   _colorAnimations = List.generate(
  //     _itemCount,
  //     (index) {
  //       return ColorTween(
  //         begin: _dotColors[index],
  //         end: _dotColors[index],
  //       ).animate(
  //         CurvedAnimation(
  //           parent: _controller,
  //           curve: Interval(
  //               index * endAnimation, index * endAnimation + endAnimation),
  //         ),
  //       );
  //     },
  //   ).toList();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(_itemCount, (i) {
            final position = widget.size * .5;
            //центральное положение виджета(radius)
            return Positioned.fill(
              left: position,
              top: position,
              child: Transform(
                transform:
                    Matrix4.rotationZ(360 / _itemCount * i * math.pi / 180),
                child: Align(
                  alignment: Alignment.center,
                  child: ScaleTransition(
                    scale: DelayTween(
                      begin: 0.4,
                      end: 1.0,
                      delay: i / _itemCount,
                    ).animate(_controller),
                    child: FadeTransition(
                      opacity: DelayTween(
                        begin: 0.2,
                        end: 1.0,
                        delay: i / _itemCount,
                      ).animate(_controller),
                      child: SizedBox.fromSize(
                        size: Size.square(widget.size * .15),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: _dotColors[i],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DelayTween extends Tween<double> {
  DelayTween({
    double? begin,
    double? end,
    required this.delay,
  }) : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) {
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }
//Основная формула begin + t * (end - begin)
//(t - delay) - величина задержки
//Величина 2 * math.pi используется для преобразования значения из диапазона от 0,0 до 1,0 в диапазон от 0,0 до 2π радиан .
//+ 1) / 2) -  функция синуса генерирует значения от -1 до 1, добавление 1 и деление на 2 возвращает значение в диапазон от 0,0 до 1,0.

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
//Метод evaluate переопределяется для вызова пользовательского метода lerp с текущим значением объекта Animation<double>. 
