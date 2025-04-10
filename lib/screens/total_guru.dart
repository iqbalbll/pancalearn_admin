import 'package:flutter/material.dart';


class TotalGuru extends StatelessWidget {
  const TotalGuru({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 640;
          return Row(
            children: [
              if (isDesktop) _buildSidebar(),
              Expanded(
                child: Column(
                  children: [
                    _buildTopBar(),
                    _buildBreadcrumb(),
                    Expanded(
                      child: _buildMainContent(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 306,
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
            padding: const EdgeInsets.only(left: 74, top: 22, bottom: 60),
            child: Text(
              'Admin',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontFamily: 'Karla',
              ),
            ),
          ),
          _buildSidebarItem(
            icon: Icons.dashboard,
            label: 'Dashboard',
            showArrow: true,
          ),
          _buildSidebarItem(
            icon: Icons.school,
            label: 'Siswa',
            showArrow: true,
          ),
          _buildSidebarItem(
            icon: Icons.person,
            label: 'Guru',
            showArrow: true,
          ),
          _buildSidebarItem(
            icon: Icons.class_,
            label: 'Kelas',
            showArrow: true,
          ),
          _buildSidebarItem(
            icon: Icons.schedule,
            label: 'Jadwal',
            showArrow: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem({
    required IconData icon,
    required String label,
    bool showArrow = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 40),
          const SizedBox(width: 30),
          Text(
            label,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: 'Karla',
            ),
          ),
          if (showArrow) ...[
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 30,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 77,
      color: const Color(0xFF006181),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.admin_panel_settings, color: Colors.white, size: 40),
              const SizedBox(width: 5),
              Text(
                'Admin',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Karla',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Logout',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Karla',
                ),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.logout, color: Colors.white, size: 40),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Container(
      width: double.infinity,
      height: 36,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: const Color(0xFFD9D9D9),
      child: Text(
        'Home > total guru',
          style: TextStyle(fontSize: 20,
          fontFamily: 'Karla',
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Total :',
                style: TextStyle(fontSize: 20,
                  fontFamily: 'Karla',
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 114,
                height: 28,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFECEBEB),
                border: Border.all(color: Colors.black),
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
              child: Column(
                children: [
                  _buildTableHeader(),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    final headerStyle = TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontFamily: 'Karla',
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black)),
      ),
      child: Row(
        children: [
          _buildHeaderCell('No', flex: 1, style: headerStyle),
          _buildHeaderCell('NAMA', flex: 3, style: headerStyle),
          _buildHeaderCell('P/L', flex: 1, style: headerStyle),
          _buildHeaderCell('NIP', flex: 3, style: headerStyle),
          _buildHeaderCell('Jabatan', flex: 3, style: headerStyle),
          _buildHeaderCell('No. tlp', flex: 3, style: headerStyle),
          _buildHeaderCell('Edit', flex: 1, style: headerStyle),
          _buildHeaderCell('Hapus', flex: 1, style: headerStyle),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text, {required int flex, required TextStyle style}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}