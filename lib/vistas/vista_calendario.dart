import 'package:flutter/material.dart';
import '../theme.dart';

class VistaCalendario extends StatelessWidget {
  const VistaCalendario({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 7, child: _buildCalendarSection()),
              const SizedBox(width: 32),
              Expanded(flex: 3, child: _buildSidePanel()),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCalendarSection(),
              const SizedBox(height: 32),
              _buildSidePanel(),
            ],
          );
        }
      },
    );
  }

  Widget _buildCalendarSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top Bar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _buildNavButton(Icons.chevron_left),
                const SizedBox(width: 16),
                const Text('Abril 2026', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 16),
                _buildNavButton(Icons.chevron_right),
              ],
            ),
            Row(
              children: [
                _buildViewToggleButton('Mes', true),
                _buildViewToggleButton('Semana', false),
                _buildViewToggleButton('Día', false),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        
        // Calendar Grid Container
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0x332A9D8F)),
          ),
          child: Column(
            children: [
              // Days Header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    'DOM', 'LUN', 'MAR', 'MIÉ', 'JUE', 'VIE', 'SÁB'
                  ].map((day) => Expanded(
                    child: Center(
                      child: Text(day, style: const TextStyle(color: AppColors.textTertiary, fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  )).toList(),
                ),
              ),
              const Divider(color: Color(0x332A9D8F), height: 1),
              // Grid
              _buildMonthGrid(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: AppColors.textPrimary, size: 20),
    );
  }

  Widget _buildViewToggleButton(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.accent.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isActive ? Border.all(color: AppColors.accent.withOpacity(0.5)) : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? AppColors.accent : AppColors.textTertiary,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildMonthGrid() {
    // Simulando los datos de Abril 2026 que empieza un Miércoles (asumiendo formato)
    // Para simplificar la demo, lo haré hardcoded basado en la imagen.
    return Column(
      children: [
        _buildWeekRow(['30', '31', '1', '2', '3', '4', '5'], [
          // Eventos semana 1
          _CalendarEvent(day: '2', title: 'Redes III 10AM', type: EventType.redes),
          _CalendarEvent(day: '3', title: 'SO 8AM', type: EventType.so),
          _CalendarEvent(day: '4', title: 'Redes III 10AM', type: EventType.redes),
          _CalendarEvent(day: '4', title: 'Seg. Info 2PM', type: EventType.seguridad),
        ]),
        _buildWeekRow(['6', '7', '8', '9', '10', '11', '12'], [
          _CalendarEvent(day: '7', title: 'BD II 7AM', type: EventType.bd),
          _CalendarEvent(day: '8', title: 'Redes III 10AM', type: EventType.redes),
          _CalendarEvent(day: '9', title: 'SO 8AM', type: EventType.so),
          _CalendarEvent(day: '9', title: 'BD II 3PM', type: EventType.bd),
          _CalendarEvent(day: '10', title: 'Seg. Info 2PM', type: EventType.seguridad),
          _CalendarEvent(day: '11', title: 'Redes III 10AM', type: EventType.redes),
        ]),
        _buildWeekRow(['13', '14', '15', '16', '17', '18', '19'], [
          _CalendarEvent(day: '14', title: 'BD II 7AM', type: EventType.bd),
          _CalendarEvent(day: '15', title: 'Redes III 10AM', type: EventType.redes),
          _CalendarEvent(day: '16', title: 'SO 8AM', type: EventType.so),
          _CalendarEvent(day: '17', title: 'Redes III 10AM', type: EventType.redes),
          _CalendarEvent(day: '17', title: 'Seg. Info 2PM', type: EventType.seguridad),
        ]),
        _buildWeekRow(['20', '21', '22', '23', '24', '25', '26'], [
          _CalendarEvent(day: '21', title: 'BD II 7AM', type: EventType.bd),
          _CalendarEvent(day: '22', title: 'Redes III 10AM', type: EventType.redes),
          _CalendarEvent(day: '23', title: 'SO 8AM', type: EventType.so),
          _CalendarEvent(day: '23', title: 'BD II 3PM', type: EventType.bd),
          _CalendarEvent(day: '24', title: 'Seg. Info 2PM', type: EventType.seguridad),
          _CalendarEvent(day: '25', title: 'Redes III 10AM', type: EventType.redes),
        ]),
        _buildWeekRow(['27', '28', '29', '30', '1', '2', '3'], [
          _CalendarEvent(day: '27', title: 'Redes III 10AM', type: EventType.redes),
          _CalendarEvent(day: '28', title: 'BD II 7AM', type: EventType.bd),
          _CalendarEvent(day: '29', title: 'SO 8AM', type: EventType.so),
          _CalendarEvent(day: '30', title: 'Redes III 10AM', type: EventType.redes),
        ], isLastRow: true),
      ],
    );
  }

  Widget _buildWeekRow(List<String> days, List<_CalendarEvent> events, {bool isLastRow = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: days.map((day) {
          // Filtrar eventos de este día
          final dayEvents = events.where((e) => e.day == day).toList();
          final isToday = day == '27';
          final isMuted = day == '30' && days[0] == '30' || day == '31' || (day == '1' || day == '2' || day == '3') && days[0] == '27';

          return Expanded(
            child: Container(
              constraints: const BoxConstraints(minHeight: 120),
              decoration: BoxDecoration(
                border: Border(
                  top: const BorderSide(color: Color(0x332A9D8F)),
                  right: day != days.last ? const BorderSide(color: Color(0x332A9D8F)) : BorderSide.none,
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isToday ? AppColors.accent : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        day,
                        style: TextStyle(
                          color: isToday ? Colors.white : (isMuted ? AppColors.textTertiary.withOpacity(0.5) : AppColors.textSecondary),
                          fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...dayEvents.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getColorForEvent(e.type).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: _getColorForEvent(e.type).withOpacity(0.3)),
                      ),
                      child: Text(
                        e.title,
                        style: TextStyle(
                          color: _getColorForEvent(e.type),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _getColorForEvent(EventType type) {
    switch (type) {
      case EventType.redes: return AppColors.accent;
      case EventType.so: return Colors.blueAccent;
      case EventType.seguridad: return Colors.purpleAccent;
      case EventType.bd: return Colors.orangeAccent;
    }
  }

  Widget _buildSidePanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Hoy
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0x332A9D8F)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('HOY — LUN 27 ABR', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
              const SizedBox(height: 24),
              _buildAgendaItem('10:00', 'Redes III', 'Ing. Mena • VRT-301', EventType.redes),
              const SizedBox(height: 24),
              _buildAgendaItem('14:00', 'Seg. Informática', 'Ing. Pérez • VRT-108', EventType.seguridad),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        // Esta semana bar chart
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0x332A9D8F)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('ESTA SEMANA', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
              const SizedBox(height: 24),
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildBar('D', 10, false),
                    _buildBar('L', 40, true),
                    _buildBar('M', 20, false),
                    _buildBar('X', 30, false),
                    _buildBar('J', 25, false),
                    _buildBar('V', 15, false),
                    _buildBar('S', 5, false),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text('2 clases · 3h 30min esta semana', style: TextStyle(color: AppColors.textTertiary, fontSize: 11)),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Leyenda
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0x332A9D8F)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('LEYENDA', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
              const SizedBox(height: 16),
              _buildLegendItem(EventType.redes, 'Redes III'),
              const SizedBox(height: 12),
              _buildLegendItem(EventType.so, 'Sistemas Operativos'),
              const SizedBox(height: 12),
              _buildLegendItem(EventType.seguridad, 'Seguridad Informática'),
              const SizedBox(height: 12),
              _buildLegendItem(EventType.bd, 'Base de Datos II'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAgendaItem(String time, String title, String subtitle, EventType type) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 48,
          child: Text(time, style: const TextStyle(color: AppColors.textTertiary, fontSize: 13, fontWeight: FontWeight.bold)),
        ),
        Container(
          width: 3,
          height: 36,
          color: _getColorForEvent(type),
        ),
        const SizedBox(width: 12),
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
      ],
    );
  }

  Widget _buildBar(String label, double height, bool isToday) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 16,
          height: height,
          decoration: BoxDecoration(
            color: isToday ? AppColors.accent : const Color(0x332A9D8F),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: isToday ? AppColors.accent : AppColors.textTertiary, fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildLegendItem(EventType type, String name) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: _getColorForEvent(type),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Text(name, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
      ],
    );
  }
}

enum EventType { redes, so, seguridad, bd }

class _CalendarEvent {
  final String day;
  final String title;
  final EventType type;

  _CalendarEvent({required this.day, required this.title, required this.type});
}


