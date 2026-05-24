import 'package:flutter/material.dart';
import '../theme.dart';

class VistaPerfil extends StatelessWidget {
  const VistaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4, child: _buildLeftColumn()),
                  const SizedBox(width: 32),
                  Expanded(flex: 8, child: _buildRightColumn()),
                ],
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              _buildLeftColumn(),
              const SizedBox(height: 32),
              _buildRightColumn(),
            ],
          );
        }
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Mi Perfil', style: TextStyle(color: AppColors.textPrimary, fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Ciclo 01-2026 • UGB Campus Central', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.edit, color: Colors.white, size: 18),
          label: const Text('Editar perfil', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Tarjeta principal de Perfil
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0x332A9D8F)),
          ),
          child: Column(
            children: [
              // Avatar
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text('WR', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0x332A9D8F),
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.surface, width: 3),
                    ),
                    child: const Icon(Icons.edit, color: AppColors.accent, size: 16),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Walter Ramírez', style: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Estudiante • Ing. en Sistemas', style: TextStyle(color: AppColors.accent, fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('Carnet: 21-0045-87', style: TextStyle(color: AppColors.textTertiary, fontSize: 13)),
              const SizedBox(height: 32),

              // Métricas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMetric('4', 'AULAS', AppColors.textPrimary),
                  Container(width: 1, height: 40, color: const Color(0x332A9D8F)),
                  _buildMetric('39', 'CLASES', AppColors.textPrimary),
                  Container(width: 1, height: 40, color: const Color(0x332A9D8F)),
                  _buildMetric('94%', 'ASIST.', AppColors.accent),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Medallas / Logros
        _buildBadgeItem('Asistencia Perfecta', 'Redes III • Abril 2026', Icons.military_tech, Colors.amber),
        const SizedBox(height: 12),
        _buildBadgeItem('Sesión Segura', 'VPN activa 30+ días', Icons.lock, Colors.yellow),
        const SizedBox(height: 12),
        _buildBadgeItem('Conexión Rápida', 'Latencia < 50ms promedio', Icons.bolt, Colors.orangeAccent),
      ],
    );
  }

  Widget _buildMetric(String value, String label, Color valueColor) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: valueColor, fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: AppColors.textTertiary, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildBadgeItem(String title, String subtitle, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x332A9D8F)),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: AppColors.textTertiary, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Información Académica
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0x332A9D8F)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('INFORMACIÓN ACADÉMICA', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0x332A9D8F)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Editar', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoField('NOMBRE COMPLETO', 'Walter Jose Ramírez'),
                        const SizedBox(height: 24),
                        _buildInfoField('CARRERA', 'Ingeniería en Sistemas'),
                        const SizedBox(height: 24),
                        _buildInfoField('CARNET ESTUDIANTIL', '21-0045-87', valueColor: AppColors.accent),
                      ],
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoField('CORREO INSTITUCIONAL', 'wr21004587@ugb.edu.sv'),
                        const SizedBox(height: 24),
                        _buildInfoField('CICLO ACTUAL', '7º ciclo • 01-2026'),
                        const SizedBox(height: 24),
                        _buildInfoField('SEDE', 'Campus Central • UGB'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Actividad Reciente
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0x332A9D8F)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('ACTIVIDAD RECIENTE', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                  const Text('Últimas 48h', style: TextStyle(color: AppColors.textTertiary, fontSize: 11)),
                ],
              ),
              const SizedBox(height: 24),
              _buildActivityItem('Asistió a Redes III', 'Protocolos TCP/IP • VRT-301 • 1h 20min', 'Hoy 10:00', AppColors.accent, Icons.wifi),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0x332A9D8F), height: 1)),
              _buildActivityItem('Asistió a Seguridad Informática', 'Criptografía asimétrica • VRT-108 • 1h 30min', 'Vie 14:00', Colors.purpleAccent, Icons.security),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0x332A9D8F), height: 1)),
              _buildActivityItem('Asistió a Redes III', 'Ruteo dinámico OSPF • VRT-301 • 1h 32min', 'Vie 10:00', AppColors.accent, Icons.wifi),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0x332A9D8F), height: 1)),
              _buildActivityItem('Asistió a Base de Datos II', 'Optimización de consultas • VRT-402 • 2h', 'Jue 07:00', Colors.orangeAccent, Icons.storage),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Botones de Acción
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.key, color: Colors.amber, size: 18),
                label: const Text('Cambiar contraseña', style: TextStyle(color: AppColors.textPrimary)),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Color(0x332A9D8F)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                side: BorderSide(color: Colors.redAccent.withOpacity(0.3)),
                backgroundColor: Colors.redAccent.withOpacity(0.05),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Cerrar sesión', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoField(String label, String value, {Color valueColor = AppColors.textPrimary}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textTertiary, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(value, style: TextStyle(color: valueColor, fontSize: 14, fontFamily: 'monospace')),
      ],
    );
  }

  Widget _buildActivityItem(String title, String subtitle, String time, Color iconColor, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 18),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: AppColors.textTertiary, fontSize: 12)),
            ],
          ),
        ),
        Text(time, style: const TextStyle(color: AppColors.textTertiary, fontSize: 12)),
      ],
    );
  }
}


