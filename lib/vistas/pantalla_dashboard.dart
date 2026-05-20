import 'package:flutter/material.dart';
import '../theme.dart';
import 'vista_inicio.dart';
import 'vista_mis_aulas.dart';
import 'vista_calendario.dart';
import 'vista_unirse_clase.dart';
import 'vista_tunel_vpn.dart';
import 'vista_perfil.dart';
import 'vista_configuracion.dart';

class PantallaDashboard extends StatefulWidget {
  const PantallaDashboard({super.key});

  @override
  State<PantallaDashboard> createState() => _PantallaDashboardState();
}

class _PantallaDashboardState extends State<PantallaDashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // Sidebar para pantallas grandes
          if (MediaQuery.of(context).size.width > 800) _buildSidebar(),
          
          // Contenido Principal
          Expanded(
            child: Column(
              children: [
                _buildTopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32.0),
                    child: _buildMainContent(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Drawer para pantallas pequeñas
      drawer: MediaQuery.of(context).size.width <= 800 ? Drawer(child: _buildSidebar()) : null,
    );
  }

  Widget _buildMainContent() {
    switch (_selectedIndex) {
      case 0:
        return const VistaInicio();
      case 1:
        return const VistaMisAulas();
      case 2:
        return const VistaCalendario();
      case 3:
        return const VistaUnirseClase();
      case 4:
        return const VistaTunelVpn();
      case 5:
        return const VistaPerfil();
      case 6:
        return const VistaConfiguracion();
      default:
        return const Center(
          child: Text('Pantalla en construcción...', style: TextStyle(color: AppColors.textSecondary, fontSize: 18)),
        );
    }
  }

  Widget _buildSidebar() {
    return Container(
      width: 250,
      color: const Color(0xFF13161D),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Icon(Icons.link, color: AppColors.accent, size: 24),
                SizedBox(width: 8),
                Text('IronLink', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 48),
          
          _buildSidebarSection('NAVEGACIÓN'),
          _buildSidebarItem(0, Icons.home_filled, 'Inicio'),
          _buildSidebarItem(1, Icons.grid_view_rounded, 'Mis aulas'),
          _buildSidebarItem(2, Icons.calendar_month, 'Calendario'),
          _buildSidebarItem(3, Icons.cast_for_education, 'Unirse a clase'),
          
          const SizedBox(height: 24),
          _buildSidebarSection('RED'),
          _buildSidebarItem(4, Icons.security, 'Túnel VPN'),
          
          const Spacer(),
          _buildSidebarSection('PERFIL'),
          _buildSidebarItem(5, Icons.person, 'Walter Ramírez'),
          _buildSidebarItem(6, Icons.settings, 'Configuración'),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSidebarSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, bottom: 12.0, top: 12.0),
      child: Text(
        title,
        style: const TextStyle(color: AppColors.textTertiary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }

  Widget _buildSidebarItem(int index, IconData icon, String title) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent.withOpacity(0.1) : Colors.transparent,
          border: isSelected ? const Border(right: BorderSide(color: AppColors.accent, width: 3)) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? AppColors.accent : AppColors.textTertiary, size: 20),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.accent : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(bottom: BorderSide(color: Color(0xFF1A1D24))),
      ),
      child: Row(
        children: [
          if (MediaQuery.of(context).size.width <= 800)
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF0F1A15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.accentDark.withOpacity(0.5)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.circle, color: AppColors.accent, size: 8),
                const SizedBox(width: 8),
                Text('VPN • UGB-NODE-01', style: TextStyle(color: AppColors.accent.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          
          const Spacer(),
          
          Stack(
            children: [
              const Icon(Icons.notifications_none, color: AppColors.textTertiary, size: 28),
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.warning,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('WR', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
