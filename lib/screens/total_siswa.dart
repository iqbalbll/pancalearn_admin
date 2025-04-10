import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class TotalSiswa extends StatelessWidget {
  const TotalSiswa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 640;
    final isTablet = screenWidth < 991;

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: isMobile ? 70 : (isTablet ? 250 : 306),
            color: const Color(0xFF006181),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 15 : (isTablet ? 20 : 74),
                    vertical: 22,
                  ),
                  child: Text(
                    'Admin',
                    style: TextStyle(
                      fontFamily: 'karla',
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                _buildSidebarItem(
                  icon: 'assets/icons/dashboard.png',
                  label: 'Dashboard',
                  isMobile: isMobile,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  icon: 'assets/student_icon.svg',
                  label: 'Siswa',
                  isMobile: isMobile,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  icon: 'assets/teacher_icon.svg',
                  label: 'Guru',
                  isMobile: isMobile,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  icon: 'assets/class_icon.svg',
                  label: 'Kelas',
                  isMobile: isMobile,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  icon: 'assets/schedule_icon.svg',
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
                // Top Bar
                Container(
                  height: 77,
                  color: const Color(0xFF006181),
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : (isTablet ? 40 : 184),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.admin_panel_settings,
                              color: Colors.white, size: 40),
                          const SizedBox(width: 5),
                          Text(
                            'Admin',
                            style: TextStyle(
                              fontFamily: 'karla',
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontFamily: 'karla',
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.logout,
                              color: Colors.white, size: 40),
                        ],
                      ),
                    ],
                  ),
                ),
                // Breadcrumb
                Container(
                  height: 36,
                  color: const Color(0xFFD9D9D9),
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Home > total siswa',
                    style: TextStyle(
                      fontFamily: 'karla',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // Content Area
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 16 : (isTablet ? 20 : 24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Filters
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'kelas',
                                    style: TextStyle(fontSize: 20, fontFamily: 'karla'),
                                  ),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text(
                            'Total :',
                            style: TextStyle(fontSize: 20, fontFamily: 'karla'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Table
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFECEBEB),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(-4, -4),
                                  blurRadius: 20.9,
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(4, 4),
                                  blurRadius: 17.9,
                                ),
                              ],
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: [
                                  'Nama',
                                  'P/L',
                                  'NIS',
                                  'Alamat',
                                  'Edit',
                                  'Haps'
                                ].map((label) => DataColumn(
                                  label: Text(
                                    label,
                                    style: TextStyle(
                                      fontFamily: 'karla',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )).toList(),
                                rows: const [],
                              ),
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

  Widget _buildSidebarItem({
    required String icon,
    required String label,
    required bool isMobile,
    required bool isTablet,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 15 : (isTablet ? 20 : 67),
        vertical: 10,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 40,
            height: 40,
            color: Colors.white,
          ),
          if (!isMobile) ...[
            const SizedBox(width: 15),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'karla',
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/arrow_icon.svg',
              width: 50,
              height: 50,
              color: Colors.white,
            ),
          ],
        ],
      ),
    );
  }
}
