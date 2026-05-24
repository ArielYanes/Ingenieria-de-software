import 'package:flutter/material.dart';
import '../theme.dart';

class VistaTunelVpn extends StatefulWidget {
  const VistaTunelVpn({super.key});

  @override
  State<VistaTunelVpn> createState() => _VistaTunelVpnState();
}

class _VistaTunelVpnState extends State<VistaTunelVpn> {
  bool _killSwitch = true;
  bool _autoconectar = true;
  bool _dnsHttps = false;
  bool _isConnected = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 7, child: _buildMainColumn()),
              const SizedBox(width: 32),
              Expanded(flex: 3, child: _buildSidePanel()),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMainColumn(),
              const SizedBox(height: 32),
              _buildSidePanel(),
            ],
          );
        }
      },
    );
  }

  Widget _buildMainColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32),
        const Center(
          child: Text(
            'ESTADO DEL TÚNEL',
            style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ),
        const SizedBox(height: 8),
        const Center(
          child: Text(
            'IronLink NET',
            style: TextStyle(color: AppColors.textPrimary, fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: -0.5),
          ),
        ),
        const SizedBox(height: 64),
        
        // Círculo central "CONECTADO/DESCONECTADO"
        GestureDetector(
          onTap: () {
            setState(() {
              _isConnected = !_isConnected;
            });
          },
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.background,
                border: Border.all(color: _isConnected ? AppColors.accent : Colors.redAccent, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: _isConnected ? AppColors.accent.withOpacity(0.15) : Colors.redAccent.withOpacity(0.15),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock, color: Colors.amber, size: 40),
                  const SizedBox(height: 16),
                  Text(
                    _isConnected ? 'CONECTADO' : 'DESCONECTADO',
                    style: TextStyle(
                      color: _isConnected ? AppColors.accent : Colors.redAccent, 
                      fontSize: 13, 
                      fontWeight: FontWeight.bold, 
                      letterSpacing: 1.5
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 48),
        
        Center(
          child: Text(
            _isConnected ? 'Túnel encriptado activo - Toca para desconectar' : 'Túnel inactivo - Toca para conectar',
            style: const TextStyle(color: AppColors.textTertiary, fontSize: 13),
          ),
        ),
        const SizedBox(height: 48),

        // Stats Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatBox(_isConnected ? '42ms' : '-', 'LATENCIA', _isConnected ? AppColors.accent : AppColors.textTertiary),
            const SizedBox(width: 16),
            _buildStatBox(_isConnected ? '↑ 2.1' : '↑ -', 'MBPS SUBIDA', _isConnected ? AppColors.accent : AppColors.textTertiary),
            const SizedBox(width: 16),
            _buildStatBox(_isConnected ? '↓ 8.4' : '↓ -', 'MBPS BAJADA', _isConnected ? AppColors.accent : AppColors.textTertiary),
          ],
        ),
        const SizedBox(height: 32),

        // Botón conectar/desconectar
        Center(
          child: SizedBox(
            width: 400,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isConnected = !_isConnected;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _isConnected ? Colors.red.shade100 : AppColors.accent.withOpacity(0.15), 
                side: BorderSide(color: _isConnected ? Colors.transparent : AppColors.accent),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                _isConnected ? 'Desconectar túnel' : 'Conectar túnel',
                style: TextStyle(
                  color: _isConnected ? Colors.redAccent : AppColors.accent, 
                  fontSize: 16, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 48),

        // Terminal Log Box
        Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0x332A9D8F)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _isConnected ? [
                const Text('[09:48:12] Túnel establecido con UGB-NODE-01', style: TextStyle(color: AppColors.accent, fontFamily: 'monospace', fontSize: 12)),
                const SizedBox(height: 4),
                const Text('[09:48:13] Encriptación AES-256 activa', style: TextStyle(color: AppColors.accent, fontFamily: 'monospace', fontSize: 12)),
                const SizedBox(height: 4),
                const Text('[09:48:13] DNS privado: 10.8.0.1', style: TextStyle(color: AppColors.accent, fontFamily: 'monospace', fontSize: 12)),
              ] : [
                const Text('[09:48:12] Túnel cerrado', style: TextStyle(color: Colors.redAccent, fontFamily: 'monospace', fontSize: 12)),
                const SizedBox(height: 4),
                const Text('[09:48:13] conexión perdida', style: TextStyle(color: Colors.redAccent, fontFamily: 'monospace', fontSize: 12)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }

  Widget _buildStatBox(String value, String label, Color valueColor) {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0x332A9D8F)),
      ),
      child: Column(
        children: [
          Text(value, style: TextStyle(color: valueColor, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: AppColors.textTertiary, fontSize: 9, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSidePanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Servidores Disponibles
        const Text('SERVIDORES DISPONIBLES', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        const SizedBox(height: 16),
        _buildServerItem('UGB-NODE-01', 'San Miguel, SV • Nodo principal', '42ms', true, 'sv'),
        const SizedBox(height: 12),
        _buildServerItem('UGB-NODE-02', 'San Salvador, SV • Nodo secundario', '67ms', false, 'sv'),
        const SizedBox(height: 12),
        _buildServerItem('US-RELAY-01', 'Miami, FL • Relay internacional', '148ms', false, 'us', isWarning: true),
        
        const SizedBox(height: 48),

        // Información de Conexión
        const Text('INFORMACIÓN DE CONEXIÓN', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        const SizedBox(height: 16),
        _buildInfoRow('IP privada', _isConnected ? '10.8.0.45' : '-', _isConnected ? AppColors.accent : AppColors.textTertiary),
        const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0x332A9D8F), height: 1)),
        _buildInfoRow('IP pública', _isConnected ? '186.45.12.99' : '-', _isConnected ? AppColors.textPrimary : AppColors.textTertiary),
        const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0x332A9D8F), height: 1)),
        _buildInfoRow('Protocolo', _isConnected ? 'WireGuard' : '-', _isConnected ? AppColors.accent : AppColors.textTertiary),
        const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0x332A9D8F), height: 1)),
        _buildInfoRow('Encriptación', _isConnected ? 'AES-256-GCM' : '-', _isConnected ? AppColors.accent : AppColors.textTertiary),
        const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0x332A9D8F), height: 1)),
        _buildInfoRow('DNS', _isConnected ? '10.8.0.1' : '-', _isConnected ? AppColors.textPrimary : AppColors.textTertiary),
        const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0x332A9D8F), height: 1)),
        _buildInfoRow('Tiempo conectado', _isConnected ? '18:34' : '-', _isConnected ? AppColors.textPrimary : AppColors.textTertiary),

        const SizedBox(height: 48),

        // Configuración
        const Text('CONFIGURACIÓN', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        const SizedBox(height: 16),
        _buildSwitchRow('Kill switch', 'Bloquear tráfico si VPN cae', _killSwitch, (val) => setState(() => _killSwitch = val)),
        const SizedBox(height: 16),
        _buildSwitchRow('Autoconectar', 'Al iniciar sesión', _autoconectar, (val) => setState(() => _autoconectar = val)),
        const SizedBox(height: 16),
        _buildSwitchRow('DNS sobre HTTPS', 'DOH encriptado', _dnsHttps, (val) => setState(() => _dnsHttps = val)),
      ],
    );
  }

  Widget _buildServerItem(String title, String subtitle, String ping, bool isSelected, String flagCode, {bool isWarning = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isSelected ? AppColors.accent : const Color(0x332A9D8F), width: isSelected ? 2 : 1),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 16,
            decoration: BoxDecoration(
              color: flagCode == 'us' ? Colors.redAccent : Colors.blueAccent, // Placeholder flags
              borderRadius: BorderRadius.circular(2),
            ),
          ),
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
          Text(ping, style: TextStyle(color: isWarning ? Colors.amber : AppColors.accent, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textTertiary, fontSize: 12)),
        Text(value, style: TextStyle(color: valueColor, fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildSwitchRow(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: AppColors.textTertiary, fontSize: 11)),
          ],
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.accent,
          inactiveTrackColor: const Color(0x332A9D8F),
        ),
      ],
    );
  }
}


