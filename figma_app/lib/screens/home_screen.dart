import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // AppBar custom (bukan AppBar bawaan)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'), // Ganti sesuai asset kamu
                ),
              ],
            ),
          ),
          // Discover section
          DiscoverSection(),
          // Explore More section
          ExploreMoreSection(
            children: [
              IconCard(iconPath: 'assets/icons/hiking.png', label: 'Hiking'),
              IconCard(iconPath: 'assets/icons/kayaking.png', label: 'Kayaking'),
              IconCard(iconPath: 'assets/icons/balloning.png', label: 'Balloning'),
              IconCard(iconPath: 'assets/icons/snorkling.png', label: 'Snorkling'),
            ],
          ),
        ],
      ),
    );
  }
}


class DiscoverSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              TabButton(label: 'Places'),
              TabButton(label: 'Inspiration'),
              TabButton(label: 'Emotions'),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 180,
            child: PageView(
              controller: PageController(viewportFraction: 0.8),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          imagePath: 'assets/images/peakpx_3_1.png',
                          title: 'Himalaya',
                          location: 'Himachal Pradesh, India',
                          price: '\$1500',
                          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc ut laoreet cursus, nunc urna aliquam nunc, eget aliquam nunc nunc eu nunc.',
                        ),
                      ),
                    );
                  },
                  child: ImageSlideWidget(imagePath: 'assets/images/peakpx_3_1.png'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          imagePath: 'assets/images/peakpx_2_1.png',
                          title: 'Everest',
                          location: 'Nepal',
                          price: '\$2000',
                          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc ut laoreet cursus, nunc urna aliquam nunc, eget aliquam nunc nunc eu nunc.',
                        ),
                      ),
                    );
                  },
                  child: ImageSlideWidget(imagePath: 'assets/images/peakpx_2_1.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String label;

  TabButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {},
        child: Text(label, style: TextStyle(fontSize: 16, color: Colors.blue)),
      ),
    );
  }
}

class ExploreMoreSection extends StatelessWidget {
  final List<Widget> children;

  const ExploreMoreSection({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore More',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          ),
        ],
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final String iconPath;
  final String label;

  const IconCard({required this.iconPath, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconPath,
          width: 40,
          height: 40,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ImageSlideWidget extends StatelessWidget {
  final String imagePath;

  const ImageSlideWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
