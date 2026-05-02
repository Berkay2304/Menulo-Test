import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';
import 'package:menulo/notitiers/page_notifiers.dart';
import 'package:menulo/pages/Splash/splash_screen.dart';


import 'package:menulo/models/user_model.dart';
import 'package:menulo/data/mock_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isDarkMode = false;
  bool _isEditing = false;
  
  
  late UserModel _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = MockData.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: _isEditing
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  setState(() => _isEditing = false);
                },
              )
            : null,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gabarito',
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.brandColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  color: AppColors.brandColor,
                ),
                Positioned(
                  bottom: -60,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey,
                          
                          backgroundImage: AssetImage(_currentUser.profileImageUrl),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            
            if (!_isEditing) ...[
              Text(
                "${_currentUser.firstName} ${_currentUser.lastName}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gabarito',
                ),
              ),
              const SizedBox(height: 5),
              Text(
                _currentUser.email,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'Gabarito',
                ),
              ),
              const SizedBox(height: 20),
            ],

            _isEditing
                ? _buildEditForm()
                : _buildProfileView(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileView() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => setState(() => _isEditing = true),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "Edit Profile",
            style: TextStyle(color: Colors.white, fontFamily: 'Gabarito'),
          ),
        ),
        const SizedBox(height: 24),
        _buildSectionHeader("Preferences"),
        _buildPreferenceItem(
          icon: Icons.translate,
          title: "Language",
          onTap: () {},
        ),
        _buildPreferenceItem(
          icon: Icons.dark_mode_outlined,
          title: "Darkmode",
          trailing: Switch.adaptive(
            value: _isDarkMode,
            onChanged: (v) => setState(() => _isDarkMode = v),
          ),
          onTap: () => setState(() => _isDarkMode = !_isDarkMode),
        ),
        const SizedBox(height: 40),
        _buildSignOutButton(),
      ],
    );
  }

  Widget _buildEditForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Change Picture",
              style: TextStyle(color: Colors.black54, fontFamily: 'Gabarito'),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              
              Expanded(child: _buildTextField("First Name", _currentUser.firstName)),
              const SizedBox(width: 16),
              Expanded(child: _buildTextField("Last Name", _currentUser.lastName)),
            ],
          ),
          _buildTextField("E-mail", _currentUser.email),
          _buildTextField("Password", "*********", isPassword: true),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "must contain 8 char.",
              style: TextStyle(fontSize: 12, color: Colors.blueGrey, fontFamily: 'Gabarito'),
            ),
          ),
          _buildTextField("Confirm Password", "*********", isPassword: true),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                
                setState(() => _isEditing = false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brandColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                "Update",
                style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Gabarito'),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: 'Gabarito',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: isPassword,
            style: const TextStyle(fontFamily: 'Gabarito'),
            
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'Gabarito'),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              suffixIcon: isPassword
                  ? const Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.grey,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey.shade100,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.bold,
          fontFamily: 'Gabarito',
        ),
      ),
    );
  }

  Widget _buildPreferenceItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black, size: 28),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontFamily: 'Gabarito'),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 20,
          ),
      onTap: onTap,
    );
  }

  Widget _buildSignOutButton() {
    return TextButton(
      onPressed: () {
        currentCustomerPageNotifier.value = 0;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const SplashScreen()),
          (r) => false,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Sign Out",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.brandColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Gabarito',
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.logout, color: AppColors.brandColor),
        ],
      ),
    );
  }
}