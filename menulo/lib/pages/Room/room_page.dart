import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  int currentStep = 0;
  double maxDistance = 12.0;
  String selectedFood = "Pizza";

  final String qrMockImagePath = 'assets/images/qr_mock.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFFFFA63B)),
                onPressed: () {
                  if (currentStep == 1) {
                    setState(
                      () => currentStep = 0,
                    ); 
                  } else {
                    Navigator.pop(
                      context,
                    ); 
                  }
                },
              ),
        title: Text(
          currentStep == 0 ? "Create Room" : "Room #224587",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share, color: Color(0xFFFFA63B)),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: currentStep == 0 ? _buildQRView() : _buildRoomDetailsView(),
    );
  }

  Widget _buildQRView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Column(
        children: [
          const Spacer(flex: 2),
          Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFF626262),
            child: Column(
              children: [
                const SizedBox(height: 35),
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      qrMockImagePath,
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Transform.translate(
                        offset: const Offset(-10, 0),
                        child: _buildHole(),
                      ),
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                (constraints.constrainWidth() / 10).floor(),
                                (index) => const SizedBox(
                                  width: 5,
                                  height: 1.5,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(10, 0),
                        child: _buildHole(),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Scan the QR Code",
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
                const SizedBox(height: 10),
                const Text(
                  "224 587",
                  style: TextStyle(
                    color: Color(0xFFFEA02F),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          const Spacer(flex: 3),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => setState(() => currentStep = 1),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFA63B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 2,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_forward),
                  SizedBox(width: 8),
                  Text(
                    "Go To Room",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildHole() {
    return Container(
      height: 20,
      width: 20,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildRoomDetailsView() {
    final panelColor = const Color(0xFFF1F4F8).withOpacity(0.8);
    const primaryOrange = Color(0xFFFFA63B);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Üst Panel (Hafif gri Kart)
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: panelColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle("Friends in Room"),
                Row(
                  children: [
                    _userAvatar('assets/images/face_mock.png', true),
                    _userAvatar('assets/images/face_mock.png', true),
                    _userAvatar('assets/images/face_mock.png', true),
                    _addButton(),
                  ],
                ),
                const SizedBox(height: 20),
                _sectionTitle("What are we eating?"),
                Wrap(
                  spacing: 10,
                  runSpacing: 5,
                  children: [
                    _foodChip("Pizza"),
                    _foodChip("Hamburger"),
                    _foodChip("Salad"),
                    _addButton(),
                  ],
                ),
                const SizedBox(height: 20),
                _sectionTitle("Preferences"),
                _preferenceRow('assets/images/face_mock.png', [
                  const Icon(Icons.eco, color: Colors.green),
                ]),
                _preferenceRow('assets/images/face_mock.png', [
                  const Icon(Icons.no_photography_outlined, color: Colors.red),
                  const Icon(Icons.no_food_outlined, color: Colors.red),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 30),
          _sectionTitle("Max Distance (km)"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: panelColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: primaryOrange,
                    inactiveTrackColor: Colors.orange[100],
                    thumbColor: primaryOrange,
                    overlayColor: primaryOrange.withOpacity(0.2),
                    valueIndicatorColor: primaryOrange,
                    valueIndicatorTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 10.0,
                    ),
                  ),
                  child: Slider(
                    value: maxDistance,
                    min: 1,
                    max: 50,
                    divisions: 49,
                    label: maxDistance.round().toString(),
                    onChanged: (val) => setState(() => maxDistance = val),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryOrange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 2,
              ),
              child: const Text(
                "Find Best Matches",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _userAvatar(String url, bool verified) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(radius: 24, backgroundImage: AssetImage(url)),
          ),
          if (verified)
            const Positioned(
              right: 1,
              bottom: 1,
              child: CircleAvatar(
                radius: 8.5,
                backgroundColor: Color(0xFFFFA63B),
                child: Icon(Icons.check, size: 11, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _foodChip(String label) {
    bool isSelected = selectedFood == label;
    const primaryOrange = Color(0xFFFFA63B);
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (val) => setState(() => selectedFood = label),
      selectedColor: primaryOrange,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black87,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: isSelected ? primaryOrange : Colors.grey[300]!),
      ),
      elevation: isSelected ? 2 : 0,
    );
  }

  Widget _addButton() {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: const Icon(Icons.add, size: 19, color: Color(0xFFFFA63B)),
    );
  }

  Widget _preferenceRow(String avatarUrl, List<Widget> preferenceIcons) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(radius: 18, backgroundImage: AssetImage(avatarUrl)),
          const SizedBox(width: 14),
          ...preferenceIcons.map(
            (icon) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Opacity(opacity: 0.8, child: icon),
            ),
          ),
          const Spacer(),
          _addButton(),
        ],
      ),
    );
  }
}
