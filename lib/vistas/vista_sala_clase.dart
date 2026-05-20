import 'package:flutter/material.dart';
import '../theme.dart';

class VistaSalaClase extends StatefulWidget {
  const VistaSalaClase({super.key});

  @override
  State<VistaSalaClase> createState() => _VistaSalaClaseState();
}

class _VistaSalaClaseState extends State<VistaSalaClase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 75, child: _buildMainArea()),
                Container(width: 1, color: const Color(0xFF1E2128)),
                Expanded(flex: 25, child: _buildSidebar()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: Color(0xFF1E2128))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text('IronLink', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: -0.5)),
              const SizedBox(width: 24),
              const Text('Redes III • TCP/IP', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
              const SizedBox(width: 16),
              const Text('18:33', style: TextStyle(color: AppColors.textTertiary, fontSize: 14)),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.lock, color: AppColors.accent, size: 14),
              const SizedBox(width: 6),
              const Text('Sala cifrada', style: TextStyle(color: AppColors.accent, fontSize: 12)),
              const SizedBox(width: 16),
              const Icon(Icons.circle, color: Colors.redAccent, size: 8),
              const SizedBox(width: 6),
              const Text('REC', style: TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(width: 24),
              const Icon(Icons.people, color: AppColors.textTertiary, size: 16),
              const SizedBox(width: 8),
              const Text('32 conectados', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
              const SizedBox(width: 24),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.redAccent, size: 16),
                label: const Text('Salir de clase', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.withOpacity(0.1),
                  side: BorderSide(color: Colors.redAccent.withOpacity(0.3)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainArea() {
    return Container(
      color: const Color(0xFF0D1117), // Fondo más oscuro para el área principal
      padding: const EdgeInsets.all(24),
      child: Stack(
        children: [
          // Área de presentación central
          Center(
            child: Container(
              width: 800,
              height: 500,
              decoration: BoxDecoration(
                color: const Color(0xFF161B22), // Fondo de la presentación
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1E2128)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E2128),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.desktop_windows, color: Colors.blueAccent, size: 14),
                        SizedBox(width: 8),
                        Text('Presentación del docente', style: TextStyle(color: Colors.blueAccent, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('MODELO OSI — CAPA 3 NETWORK', style: TextStyle(color: AppColors.textTertiary, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildDiagramBox('IPv4 / IPv6', Colors.cyan),
                              const SizedBox(width: 16),
                              _buildDiagramBox('ICMP', Colors.blue),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildDiagramBox('Routing', Colors.teal),
                              const SizedBox(width: 16),
                              _buildDiagramBox('ARP', Colors.indigoAccent),
                            ],
                          ),
                          const SizedBox(height: 48),
                          const Text('Protocolos de red - Capa de Internet', style: TextStyle(color: AppColors.textTertiary, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Cámara del docente (esquina inferior izquierda)
          Positioned(
            left: 24,
            bottom: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF1E2128),
                    border: Border.all(color: AppColors.accent, width: 2),
                  ),
                  child: const Center(child: Icon(Icons.person, color: AppColors.textTertiary, size: 40)), // Placeholder avatar
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.circle, color: AppColors.accent, size: 8),
                      SizedBox(width: 6),
                      Text('Ing. Ludwin - Docente', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Controles inferiores (centro)
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildControlBtn(Icons.mic_off, 'Micrófono', false),
                const SizedBox(width: 16),
                _buildControlBtn(Icons.videocam_off, 'Cámara', false),
                const SizedBox(width: 16),
                _buildControlBtn(Icons.screen_share, 'Pantalla', false),
                const SizedBox(width: 16),
                _buildControlBtn(Icons.front_hand, 'Levantar mano', true, color: Colors.amber),
                const SizedBox(width: 16),
                _buildControlBtn(Icons.chat, 'Chat', true, color: AppColors.accent),
                const SizedBox(width: 32),
                _buildControlBtn(Icons.call_end, 'Salir', true, color: Colors.redAccent, isCircle: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiagramBox(String text, Color borderColor) {
    return Container(
      width: 140,
      height: 48,
      decoration: BoxDecoration(
        color: borderColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor.withOpacity(0.5)),
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: borderColor, fontWeight: FontWeight.bold, fontSize: 13)),
      ),
    );
  }

  Widget _buildControlBtn(IconData icon, String label, bool isActive, {Color? color, bool isCircle = true}) {
    final bgColor = isActive ? (color ?? AppColors.accent).withOpacity(0.1) : const Color(0xFF1E2128);
    final iconColor = isActive ? (color ?? AppColors.accent) : AppColors.textTertiary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor,
            border: Border.all(color: isActive ? iconColor.withOpacity(0.5) : Colors.transparent),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: AppColors.textTertiary, fontSize: 11)),
      ],
    );
  }

  Widget _buildSidebar() {
    return Container(
      color: AppColors.surface,
      child: Column(
        children: [
          // Tabs
          Container(
            height: 60,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF1E2128))),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColors.accent, width: 3)),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.people, color: AppColors.accent, size: 16),
                          SizedBox(width: 8),
                          Text('Participantes (32)', style: TextStyle(color: AppColors.accent, fontSize: 13, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.notes, color: AppColors.textTertiary, size: 16),
                        SizedBox(width: 8),
                        Text('Notas', style: TextStyle(color: AppColors.textTertiary, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Lista de participantes
          Expanded(
            flex: 60,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildParticipantItem('Ing. Mena', 'Docente • Presentando', Icons.mic, AppColors.accent, isSpeaking: false),
                _buildParticipantItem('Mario Villanueva', 'Hablando...', Icons.mic, AppColors.accent, isSpeaking: true),
                _buildParticipantItem('Luis Ramirez', 'Conectado', Icons.mic_off, Colors.redAccent),
                _buildParticipantItem('Ariel Yanes', 'Conectado', Icons.mic_off, AppColors.textTertiary),
                _buildParticipantItem('Carlos Mejia', 'Conectado', Icons.mic_off, Colors.redAccent),
                _buildParticipantItem('Ana Garcia', 'Conectado', Icons.front_hand, Colors.amber),
                const SizedBox(height: 16),
                const Center(child: Text('+ 26 estudiantes más', style: TextStyle(color: AppColors.textTertiary, fontSize: 12))),
              ],
            ),
          ),

          // Chat
          Expanded(
            flex: 40,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0F1116),
                border: Border(top: BorderSide(color: Color(0xFF1E2128))),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('CHAT DE CLASE', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _buildChatMessage('Mario V.', '¿Podría repetir la parte de subnetting?', Colors.blueAccent),
                        const SizedBox(height: 12),
                        _buildChatMessage('Ing. Mena', 'Claro, lo retomo al final del slide actual 👍', AppColors.accent),
                        const SizedBox(height: 12),
                        _buildChatMessage('Luis R.', '👍', Colors.orangeAccent),
                        const SizedBox(height: 12),
                        _buildChatMessage('Ana G.', 'Muy clara la explicación del routing', Colors.cyan),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1C23),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFF2A2D35)),
                            ),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Escribe un mensaje...', style: TextStyle(color: AppColors.textTertiary, fontSize: 13)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: AppColors.accent,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.send, color: Colors.black, size: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantItem(String name, String status, IconData icon, Color iconColor, {bool isSpeaking = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSpeaking ? AppColors.accent.withOpacity(0.2) : const Color(0xFF1E2128),
              border: Border.all(color: isSpeaking ? AppColors.accent : Colors.transparent),
            ),
            child: Center(
              child: Text(name[0], style: TextStyle(color: isSpeaking ? AppColors.accent : Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(color: isSpeaking ? AppColors.accent : Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                Text(status, style: TextStyle(color: isSpeaking ? AppColors.accent.withOpacity(0.8) : AppColors.textTertiary, fontSize: 11)),
              ],
            ),
          ),
          Icon(icon, color: iconColor, size: 16),
        ],
      ),
    );
  }

  Widget _buildChatMessage(String name, String message, Color nameColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: TextStyle(color: nameColor, fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(message, style: const TextStyle(color: Colors.white, fontSize: 13)),
      ],
    );
  }
}
