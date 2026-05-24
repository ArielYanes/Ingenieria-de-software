import 'package:flutter/material.dart';
import '../theme.dart';
import '../componentes/tarjeta_clase_pequena.dart';
import 'vista_sala_clase.dart';

class VistaInicio extends StatelessWidget {
  const VistaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAlertBanner(),
        const SizedBox(height: 32),
        const Text('CLASE ACTIVA HOY', style: TextStyle(color: AppColors.textTertiary, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
        const SizedBox(height: 16),
        _buildActiveClassCard(context),
        const SizedBox(height: 32),
        const Text('MIS AULAS', style: TextStyle(color: AppColors.textTertiary, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
        const SizedBox(height: 16),
        _buildSmallClassesGrid(),
        const SizedBox(height: 32),
        const Text('NOTIFICACIONES DE HOY', style: TextStyle(color: AppColors.textTertiary, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
        const SizedBox(height: 16),
        _buildNotificationsList(),
      ],
    );
  }

  Widget _buildAlertBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x332A9D8F)),
      ),
      child: Row(
        children: [
          const Icon(Icons.bolt, color: AppColors.warning),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Clase en 5 minutos', style: TextStyle(color: AppColors.warning, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Redes III • Prof. Mena • Aula VRT-301', style: TextStyle(color: AppColors.warning.withOpacity(0.8), fontSize: 12)),
              ],
            ),
          ),
          const Text('09:55', style: TextStyle(color: AppColors.warning, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildActiveClassCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x332A9D8F)),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.radar, color: AppColors.accent, size: 28),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Redes III — Protocolos TCP/IP', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Ing. Mena • VRT-301 • 32 conectados', style: TextStyle(color: AppColors.textTertiary, fontSize: 13)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('10:00 AM', style: TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VistaSalaClase()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Unirse →', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallClassesGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 1000 ? 4 : (constraints.maxWidth > 600 ? 2 : 1);
        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 2.5,
          children: const [
            TarjetaClasePequena(title: 'Redes III', code: 'IRL-WKS-803', prof: 'Ing. Mena', students: 34, isActive: true, dotColor: Colors.blue),
            TarjetaClasePequena(title: 'Sistemas Operativos', code: 'IRL-WKS-502', prof: 'Ing. Flores', students: 28, isActive: false, dotColor: Colors.purple),
            TarjetaClasePequena(title: 'Seguridad Informática', code: 'IRL-WKS-SEC1', prof: 'Ing. Pérez', students: 31, isActive: false, dotColor: Colors.orange),
            TarjetaClasePequena(title: 'Base de Datos II', code: 'IRL-WKS-BD2', prof: 'Ing. Castro', students: 30, isActive: false, dotColor: Colors.yellow),
          ],
        );
      },
    );
  }

  Widget _buildNotificationsList() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x332A9D8F)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notificaciones', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(12)),
                  child: const Text('2', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0x332A9D8F)),
          _buildNotificationItem('Redes III comienza en 5 min', '09:55 AM', isUnread: true, color: AppColors.warning),
          const Divider(height: 1, color: Color(0x332A9D8F)),
          _buildNotificationItem('Ing. Flores inició Sistemas Operativos', '08:02 AM', isUnread: true, color: Colors.purple),
          const Divider(height: 1, color: Color(0x332A9D8F)),
          _buildNotificationItem('Tarea de BD II actualizada', 'Ayer, 04:30 PM', isUnread: false, color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String title, String time, {required bool isUnread, required Color color}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 2,
            height: 40,
            color: color,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: isUnread ? AppColors.textPrimary : AppColors.textSecondary, fontWeight: isUnread ? FontWeight.bold : FontWeight.normal)),
                const SizedBox(height: 4),
                Text(time, style: const TextStyle(color: AppColors.textTertiary, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


