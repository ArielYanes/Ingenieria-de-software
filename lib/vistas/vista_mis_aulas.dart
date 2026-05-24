import 'package:flutter/material.dart';
import '../theme.dart';
import '../componentes/tarjeta_clase_grande.dart';

class VistaMisAulas extends StatelessWidget {
  const VistaMisAulas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header de Mis Aulas
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mis Aulas', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                SizedBox(height: 4),
                Text('4 materias matriculadas • Ciclo 01-2024', style: TextStyle(color: AppColors.textTertiary, fontSize: 14)),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 18),
              label: const Text('+ Nueva Aula', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        
        // Filtros y Buscador
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextField(
                style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Buscar aula o docente...',
                  hintStyle: const TextStyle(color: AppColors.textTertiary),
                  prefixIcon: const Icon(Icons.search, color: AppColors.textTertiary, size: 20),
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0x332A9D8F)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0x332A9D8F)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            _buildFilterChip('Todos', isActive: true),
            const SizedBox(width: 8),
            _buildFilterChip('Activas', isActive: false),
            const SizedBox(width: 8),
            _buildFilterChip('Inactivas', isActive: false),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 32),

        // Grid de Aulas (Tarjetas Grandes)
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 1200 ? 3 : (constraints.maxWidth > 800 ? 2 : 1);
            return GridView.count(
              crossAxisCount: crossAxisCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 1.25,
              children: const [
                TarjetaClaseGrande(
                  title: 'Redes III',
                  subtitle: 'IRL-WKS-R03 - Ing. Mena - Aula VRT-301',
                  students: 34,
                  classesGiven: 12,
                  isActive: true,
                  icon: Icons.radar,
                  themeColor: AppColors.accent,
                  alertText: 'Clase en 5 min - 10:00 AM',
                ),
                TarjetaClaseGrande(
                  title: 'Sistemas Operativos',
                  subtitle: 'IRL-WKS-S02 - Ing. Flores - Aula VRT-214',
                  students: 28,
                  classesGiven: 9,
                  isActive: false,
                  icon: Icons.computer,
                  themeColor: Colors.blueAccent,
                ),
                TarjetaClaseGrande(
                  title: 'Seguridad Informática',
                  subtitle: 'IRL-WKS-SEC1 - Ing. Pérez - Aula VRT-108',
                  students: 22,
                  classesGiven: 7,
                  isActive: false,
                  icon: Icons.lock_outline,
                  themeColor: Colors.purpleAccent,
                ),
                TarjetaClaseGrande(
                  title: 'Base de Datos II',
                  subtitle: 'IRL-WKS-BD2 - Ing. Castro - Aula VRT-402',
                  students: 30,
                  classesGiven: 11,
                  isActive: false,
                  icon: Icons.storage,
                  themeColor: Colors.amber,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, {required bool isActive}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? AppColors.accent.withOpacity(0.1) : AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isActive ? AppColors.accent : const Color(0x332A9D8F)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.accent : AppColors.textTertiary,
          fontSize: 13,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}


