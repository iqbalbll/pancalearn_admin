import 'package:flutter/material.dart';


class TampilSiswa extends StatelessWidget {
  const TampilSiswa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 640;
    final isTablet = screenWidth <= 991;

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: isMobile ? 90 : (isTablet ? 255 : 306),
            color: const Color(0xFF006181),
            child: Column(
              children: [
                // Logo
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 10 : 27,
                    vertical: 19,
                  ),
                  child: Text(
                    'PancaLearn',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: isMobile ? 20 : (isTablet ? 32 : 40),
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Navigation Items
                _buildNavItem(
                  context: context,
                  icon: 'assets/dashboard_icon.png',
                  label: 'Dashboard',
                  isMobile: isMobile,
                  isTablet: isTablet,
                ),
                _buildNavItem(
                  context: context,
                  icon: 'assets/student_icon.png',
                  label: 'Siswa',
                  isSelected: true,
                  isMobile: isMobile,
                  isTablet: isTablet,
                ),
                _buildNavItem(
                  context: context,
                  icon: 'assets/icons/profile.png',
                  label: 'Guru',
                  isMobile: isMobile,
                  isTablet: isTablet,
                ),
                _buildNavItem(
                  context: context,
                  icon: 'assets/schedule_icon.png',
                  label: 'Jadwal',
                  isMobile: isMobile,
                  isTablet: isTablet,
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Column(
              children: [
                // Header
                Container(
                  height: 77,
                  color: const Color(0xFF006181),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Admin Section
                      Row(
                        children: [
                          Image.asset('assets/admin_icon.png', width: 40, height: 40),
                          const SizedBox(width: 10),
                          Text(
                            'Admin',
                            style: TextStyle(
                              fontFamily: 'Karla',
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      // Logout Section
                      Row(
                        children: [
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontFamily: 'Karla',
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset('assets/logout_icon.png', width: 40, height: 40),
                        ],
                      ),
                    ],
                  ),
                ),
                // Content Area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SISWA',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Table Container
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFECEBEB),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(-4, -4),
                                blurRadius: 20.9,

                              ),
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(4, 4),
                                blurRadius: 17.9,
                          
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Table(
                              columnWidths: const {
                                0: FlexColumnWidth(2),
                                1: FixedColumnWidth(100),
                                2: FixedColumnWidth(200),
                                3: FlexColumnWidth(2),
                                4: FixedColumnWidth(100),
                                5: FixedColumnWidth(100),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    _buildTableHeader('Nama'),
                                    _buildTableHeader('P/L'),
                                    _buildTableHeader('NIS'),
                                    _buildTableHeader('Alamat'),
                                    _buildTableHeader('Edit'),
                                    _buildTableHeader('Haps'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Add Button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFC971),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: const BorderSide(color: Colors.black),
                            ),
                          ),
                          child: Text(
                            'Tambah',
                            style: TextStyle(
                              fontFamily: 'Karla',
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required String icon,
    required String label,
    bool isSelected = false,
    required bool isMobile,
    required bool isTablet,
  }) {
    return Container(
      color: isSelected ? Colors.white : Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 10 : 27,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Image.asset(icon, width: isMobile ? 30 : 40, height: isMobile ? 30 : 40),
          if (!isMobile) ...[
            const SizedBox(width: 23),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Karla',
                fontSize: isTablet ? 24 : 30,
                fontWeight: FontWeight.w500,
                color: isSelected ? const Color(0xFF006181) : Colors.white,
              ),
            ),
            const Spacer(),
            if (!isMobile)
              Icon(
                Icons.chevron_right,
                color: isSelected ? const Color(0xFF006181) : Colors.white,
                size: 50,
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Karla',
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
