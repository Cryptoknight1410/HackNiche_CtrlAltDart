import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cardproviders.dart';

class Cards extends StatefulWidget {
  final dynamic urlImage;
  final bool isFront;
  const Cards({required this.urlImage,required this.isFront});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  Widget buildfrontCard() =>
      GestureDetector(child: LayoutBuilder(builder: ((context, constraints) {
        final provider = Provider.of<CardProvider>(context,listen: false);
        final position = provider.position;
        final milliseconds = provider.isDragging ? 0 : 400;
        final center = constraints.smallest.center(Offset.zero);
        final angle = provider.angle * 3.14159265359 / 180;
        final rotatedMatrix = Matrix4.identity()
          ..translate(center.dx, center.dy)
          ..rotateZ(angle)
          ..translate(-center.dx, -center.dy);
        return AnimatedContainer(
          transform: rotatedMatrix..translate(position.dx, position.dy),
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: milliseconds),
          child: buildCard(),
        );
      })),
       onPanStart: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.startposition(details);
      },
      onPanUpdate:(details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.updateposition(details);
      },
      onPanEnd: (details) {
         final provider = Provider.of<CardProvider>(context, listen: false);
        provider.endposition();
      },

      
      );

  Widget buildCard() => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: widget.urlImage,
      );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;
      final provider = Provider.of<CardProvider>(
        context,listen: false
      );
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child:widget.isFront? buildfrontCard():buildCard(),
    );
  }
}
