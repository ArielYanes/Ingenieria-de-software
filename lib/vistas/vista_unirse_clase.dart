import 'package:flutter/material.dart';
import '../theme.dart';
import 'vista_sala_clase.dart';

class VistaUnirseClase extends StatelessWidget {
  const VistaUnirseClase({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 6, child: _buildMainColumn(context)),
              const SizedBox(width: 32),
              Expanded(flex: 4, child: _buildSidePanel()),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMainColumn(context),
              const SizedBox(height: 32),
              _buildSidePanel(),
            ],
          );
        }
      },
    );
  }

  Widget _buildMainColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Tarjeta principal EN VIVO
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: const Color(0xFF131A1D), // Un poco verde muy oscuro
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.accent.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: AppColors.accent, size: 8),
                        SizedBox(width: 6),
                        Text('EN VIVO AHORA', style: TextStyle(color: AppColors.accent, fontSize: 11, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const Text('VRT-301 • Túnel encriptado ✔', style: TextStyle(color: AppColors.textTertiary, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Redes III — Protocolos TCP/IP', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Ing. Mena • Iniciada a las 10:00 AM • Ciclo 01-2026', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
              const SizedBox(height: 32),
              
              Row(
                children: [
                  Expanded(child: _buildStatItem('32', 'CONECTADOS', Colors.white)),
                  Container(width: 1, height: 40, color: const Color(0xFF1E2128)),
                  Expanded(child: _buildStatItem('38ms', 'LATENCIA VPN', AppColors.accent)),
                  Container(width: 1, height: 40, color: const Color(0xFF1E2128)),
                  Expanded(child: _buildStatItem('47min', 'TRANSCURRIDO', Colors.white)),
                ],
              ),
              const SizedBox(height: 32),
              
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VistaSalaClase()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cast_for_education, color: Colors.black, size: 24),
                      SizedBox(width: 12),
                      Text('Unirse a Redes III →', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 48),
        const Text('CLASES DE HOY', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        const SizedBox(height: 16),
        _buildClassListItem(Icons.book, AppColors.accent, 'Redes III', 'Ing. Mena • VRT-301 • 32 conectados', 'EN VIVO', isLive: true),
        const SizedBox(height: 16),
        _buildClassListItem(Icons.security, Colors.purpleAccent, 'Seguridad Informática', 'Ing. Pérez • VRT-108', '14:00 PM'),
        
        const SizedBox(height: 48),
        const Text('PRÓXIMAS EN LA SEMANA', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        const SizedBox(height: 16),
        _buildClassListItem(Icons.storage, Colors.orangeAccent, 'Base de Datos II', 'Ing. Castro • VRT-402 • Mié 7:00 AM', 'Mié'),
        const SizedBox(height: 16),
        _buildClassListItem(Icons.computer, Colors.blueAccent, 'Sistemas Operativos', 'Ing. Flores • VRT-214 • Jue 8:00 AM', 'Jue'),
      ],
    );
  }

  Widget _buildStatItem(String value, String label, Color valueColor) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: valueColor, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: AppColors.textTertiary, fontSize: 10, letterSpacing: 1)),
      ],
    );
  }

  Widget _buildClassListItem(IconData icon, Color iconColor, String title, String subtitle, String trailing, {bool isLive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isLive ? AppColors.accent.withOpacity(0.5) : const Color(0xFF1E2128)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: AppColors.textTertiary, fontSize: 12)),
              ],
            ),
          ),
          if (isLive)
            Row(
              children: [
                const Icon(Icons.circle, color: AppColors.accent, size: 8),
                const SizedBox(width: 6),
                Text(trailing, style: const TextStyle(color: AppColors.accent, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            )
          else
            Text(trailing, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildSidePanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Tarjeta Unirse por código
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF1E2128)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.key, color: Colors.amber, size: 20),
                  SizedBox(width: 8),
                  Text('Unirse por código', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              const Text('Ingresa el código de 6 dígitos que te compartió tu docente', style: TextStyle(color: AppColors.textTertiary, fontSize: 12)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text('•  •  •  •  •  •', style: TextStyle(color: AppColors.textTertiary, fontSize: 20, letterSpacing: 4)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Entrar', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        // Estado del Túnel
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF1E2128)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.security, color: Colors.redAccent, size: 20),
                      SizedBox(width: 8),
                      Text('Estado del Túnel', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.circle, color: AppColors.accent, size: 8),
                      const SizedBox(width: 6),
                      Text('Conectado', style: TextStyle(color: AppColors.accent.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildDetailRow('Nodo activo', 'UGB-NODE-01', AppColors.textSecondary),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0xFF1E2128), height: 1)),
              _buildDetailRow('Latencia', '38 ms', AppColors.accent),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0xFF1E2128), height: 1)),
              _buildDetailRow('Ancho de banda', '1.2 MB/s', Colors.white),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0xFF1E2128), height: 1)),
              _buildDetailRow('Cifrado', 'AES-256-GCM', AppColors.textSecondary),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Verificación de dispositivo
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF1E2128)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('VERIFICACIÓN DE DISPOSITIVO', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
              const SizedBox(height: 24),
              _buildCheckItem('Micrófono detectado'),
              const SizedBox(height: 12),
              _buildCheckItem('Cámara disponible'),
              const SizedBox(height: 12),
              _buildCheckItem('VPN activa y segura'),
              const SizedBox(height: 12),
              _buildCheckItem('Ancho de banda suficiente'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textTertiary, fontSize: 12)),
        Text(value, style: TextStyle(color: valueColor, fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildCheckItem(String text) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            color: AppColors.accent,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(Icons.check, color: Colors.black, size: 10),
          ),
        ),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
      ],
    );
  }
}
