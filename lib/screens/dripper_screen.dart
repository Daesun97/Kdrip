import 'package:drip/screens/drip_details/hario_v60.dart';
import 'package:flutter/material.dart';

class DrippersCreen extends StatelessWidget {
  const DrippersCreen({super.key});

  @override
  Widget build(BuildContext context) {
    void hario() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HarioV60Recipe(),
        ),
      );
    }

    void espresso() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HarioV60Recipe(),
        ),
      );
    }

    void kalita() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HarioV60Recipe(),
        ),
      );
    }

    void french_Press() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HarioV60Recipe(),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2, // Two items per row
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          GestureDetector(
            onTap: espresso,
            child: _buildGridItem('에스프레소', Icons.coffee_maker),
          ),
          GestureDetector(
            onTap: kalita,
            child: _buildGridItem('칼리타', Icons.local_drink),
          ),
          GestureDetector(
            onTap: french_Press,
            child: _buildGridItem('프렌치 프레스', Icons.coffee_maker_outlined),
          ),
          GestureDetector(
            onTap: hario,
            child: _buildGridItem('하리오 V60', Icons.local_cafe),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String title, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60,
          color: Colors.brown,
        ),
        const SizedBox(height: 10),
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.brown,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
