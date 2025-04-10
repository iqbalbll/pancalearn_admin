import 'package:flutter/material.dart';
import 'package:pancalearn_admin/screens/tampilan_siswa.dart';
import 'package:pancalearn_admin/screens/total_siswa.dart';
import 'package:pancalearn_admin/screens/total_guru.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 640;
    final isTablet = screenWidth <= 991;

    return Scaffold(
      body: Row(
        children: [
          if (!isMobile)
            Container(
              width: isTablet ? 250 : 306,
              decoration: BoxDecoration(
                color: const Color(0xFF006181),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(10, 6),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 74,
                      top: 31,
                      bottom: 50,
                    ),
                    child: Text(
                      'Admin',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Karla',
                      ),
                    ),
                  ),
                  _buildSidebarItem(
                    icon: Icons.dashboard,
                    label: 'Dashboard',
                    isExpanded: true,
                  ),
                  GestureDetector(
                      onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const TampilSiswa(), // Halaman tujuan
                        ),
                      );
                    }, 
                    child:_buildSidebarItem(
                    icon: Icons.school,
                    label: 'Siswa',
                    isExpanded: false,
                  ),),
                  _buildSidebarItem(
                    icon: Icons.person,
                    label: 'Guru',
                    isExpanded: false,
                  ),
                  _buildSidebarItem(
                    icon: Icons.calendar_today,
                    label: 'Jadwal',
                    isExpanded: false,
                  ),
                ],
              ),
            ),
          Expanded(
            child: Column(
              children: [
Expanded(
  child: Column(
    children: [
      // AppBar Custom
      Container(
        height: 77,
        color: const Color(0xFF006181),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 64,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.admin_panel_settings,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(width: 5),
                Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                // Implement logout functionality
              },
              child: Row(
                children: [
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Breadcrumb
      Container(
        height: 36,
        color: const Color(0xFFD9D9D9),
        padding: const EdgeInsets.only(left: 9),
        alignment: Alignment.centerLeft,
        child: Text(
          'Home',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),

      // Main Content
      Expanded(
        child: Stack(
          children: [
            // Logo sebagai background dengan style yang sama seperti di ProfilScreen
            Padding(
              padding: EdgeInsets.only(top: 40), // contoh padding
              child: Transform.translate(
                offset: Offset(screenWidth * 0.3, -screenWidth * -0.13),
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/images/LOGO.png',
                    width: screenWidth * 0.5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Konten utama dashboard
            Padding(
              padding: EdgeInsets.all(isMobile ? 20 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat datang di Dashboard Admin!',
                    style: TextStyle(
                      fontSize: isMobile ? 28 : 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Platform ini dirancang untuk memudahkan pengelolaan absensi siswa. Guru bertugas mencatat kehadiran siswa.',
                    style: TextStyle(
                      fontSize: isMobile ? 20 : 24,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 28),
                  GestureDetector(
                      onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const TotalSiswa(), // Halaman tujuan
                        ),
                      );
                    },
                    child:_buildStatisticCard(
                    icon: Icons.people,
                    label: 'Total Siswa',
                    color: Colors.blue,
                  ),
                  ),
                  
                  const SizedBox(height: 28),
                            GestureDetector(
                      onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const TotalGuru(), // Halaman tujuan
                        ),
                      );
                    }, 
                    child:_buildStatisticCard(
                    icon: Icons.person_add,
                    label: 'Total Guru',
                    color: Colors.red.shade400,
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem({
    required IconData icon,
    required String label,
    required bool isExpanded,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
          const SizedBox(width: 13),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const Spacer(),
          Icon(
            isExpanded ? Icons.chevron_right : Icons.chevron_left,
            color: Colors.white,
            size: 50,
          ),
          const SizedBox(width: 13),
        ],
      ),
    );
  }

  Widget _buildStatisticCard({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      height: 112,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 60,
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
