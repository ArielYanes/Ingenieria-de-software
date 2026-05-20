import 'package:flutter/material.dart';
import '../theme.dart';

class VistaConfiguracion extends StatefulWidget {
  const VistaConfiguracion({super.key});

  @override
  State<VistaConfiguracion> createState() => _VistaConfiguracionState();
}

class _VistaConfiguracionState extends State<VistaConfiguracion> {
  int _selectedIndex = 0;

  // Notificaciones
  bool _alertaClase = true;
  bool _notifChat = true;
  bool _alertaVpn = true;
  bool _resumenSemanal = false;

  // Red & VPN
  bool _autoVpn = true;
  bool _killSwitch = false;

  // Seguridad
  bool _auth2fa = true;
  bool _notifAccesos = true;
  bool _recordarDispositivos = false;

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
                  Expanded(flex: 3, child: _buildMenuPanel()),
                  const SizedBox(width: 32),
                  Expanded(flex: 9, child: _buildContentPanel()),
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
              _buildMenuPanel(),
              const SizedBox(height: 32),
              _buildContentPanel(),
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
            const Text('Ajustes', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Personaliza tu experiencia IronLink', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.save, color: Colors.black, size: 18),
          label: const Text('Guardar cambios', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuPanel() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E2128)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildMenuItem(0, 'Notificaciones', Icons.notifications, Colors.amber),
          const SizedBox(height: 8),
          _buildMenuItem(1, 'Red & VPN', Icons.security, Colors.redAccent),
          const SizedBox(height: 8),
          _buildMenuItem(2, 'Apariencia', Icons.color_lens, Colors.orangeAccent),
          const SizedBox(height: 8),
          _buildMenuItem(3, 'Seguridad', Icons.lock, AppColors.accent),
        ],
      ),
    );
  }

  Widget _buildMenuItem(int index, String title, IconData icon, Color activeIconColor) {
    bool isSelected = _selectedIndex == index;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.accent.withOpacity(0.05) : Colors.transparent,
        border: Border(
          left: BorderSide(
            color: isSelected ? AppColors.accent : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Icon(icon, color: isSelected ? activeIconColor : AppColors.textTertiary, size: 20),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? AppColors.accent : AppColors.textSecondary,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContentPanel() {
    switch (_selectedIndex) {
      case 0:
        return _buildNotificacionesPanel();
      case 1:
        return _buildRedVpnPanel();
      case 2:
        return _buildAparienciaPanel();
      case 3:
        return _buildSeguridadPanel();
      default:
        return _buildNotificacionesPanel();
    }
  }

  // --- NOTIFICACIONES ---
  Widget _buildNotificacionesPanel() {
    return _buildPanelContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.notifications, color: Colors.amber, size: 16),
              SizedBox(width: 8),
              Text('NOTIFICACIONES', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
            ],
          ),
          const SizedBox(height: 48),

          _buildSwitchRow('Alerta antes de clase', 'Aviso 5 min antes de que inicie tu aula', _alertaClase, (val) => setState(() => _alertaClase = val)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFF1E2128), height: 1)),
          _buildSwitchRow('Notificación de chat', 'Mensajes del docente y compañeros', _notifChat, (val) => setState(() => _notifChat = val)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFF1E2128), height: 1)),
          _buildSwitchRow('Alertas de VPN', 'Avisar si el túnel se desconecta', _alertaVpn, (val) => setState(() => _alertaVpn = val)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFF1E2128), height: 1)),
          _buildSwitchRow('Resumen semanal', 'Reporte de asistencia cada domingo', _resumenSemanal, (val) => setState(() => _resumenSemanal = val)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFF1E2128), height: 1)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tiempo de alerta', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('¿Con cuántos minutos de anticipación?', style: TextStyle(color: AppColors.textTertiary, fontSize: 12)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1C23),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF2A2D35)),
                ),
                child: const Text('5 minutos', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- RED & VPN ---
  Widget _buildRedVpnPanel() {
    return _buildPanelContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.security, color: Colors.redAccent, size: 16),
              SizedBox(width: 8),
              Text('RED & VPN', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
            ],
          ),
          const SizedBox(height: 48),

          _buildSwitchRow('Autoconectar VPN al iniciar', 'El túnel se activa automáticamente', _autoVpn, (val) => setState(() => _autoVpn = val)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFF1E2128), height: 1)),
          _buildSwitchRow('Kill Switch', 'Corta el internet si VPN se cae', _killSwitch, (val) => setState(() => _killSwitch = val)),
          const SizedBox(height: 48),

          const Text('NODOS DISPONIBLES', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          const SizedBox(height: 16),
          
          _buildNodeItem('UGB-NODE-01', true, '38 ms', 'Conectado', AppColors.accent, AppColors.accent.withOpacity(0.1)),
          const SizedBox(height: 12),
          _buildNodeItem('UGB-NODE-02', true, '74 ms', 'Disponible', Colors.amber, Colors.transparent),
          const SizedBox(height: 12),
          _buildNodeItem('UGB-NODE-03', false, '- ms', 'Fuera de línea', AppColors.textTertiary, Colors.transparent),
        ],
      ),
    );
  }

  Widget _buildNodeItem(String title, bool isOnline, String ping, String status, Color statusColor, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF171A21),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: bgColor == Colors.transparent ? const Color(0xFF1E2128) : statusColor.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Icon(Icons.circle, color: isOnline ? AppColors.accent : AppColors.textTertiary, size: 10),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: TextStyle(color: isOnline ? Colors.white : AppColors.textTertiary, fontSize: 14, fontWeight: FontWeight.bold))),
          Text(ping, style: TextStyle(color: statusColor, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: bgColor == Colors.transparent ? Colors.transparent : bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(status, style: TextStyle(color: isOnline ? statusColor : AppColors.textTertiary, fontSize: 11)),
          ),
        ],
      ),
    );
  }

  // --- APARIENCIA ---
  Widget _buildAparienciaPanel() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildPanelContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.color_lens, color: Colors.orangeAccent, size: 16),
                    SizedBox(width: 8),
                    Text('APARIENCIA', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                  ],
                ),
                const SizedBox(height: 48),
                _buildAppearanceOption('Tema', 'Color base de la interfaz', 'Oscuro', Colors.blueGrey),
                const SizedBox(height: 32),
                _buildAppearanceOption('Color de acento', 'Color principal de la app', 'Verde', AppColors.accent),
              ],
            ),
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: _buildPanelContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.info, color: Colors.grey, size: 16),
                    SizedBox(width: 8),
                    Text('ACERCA DE', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                  ],
                ),
                const SizedBox(height: 48),
                _buildInfoRow('Versión', 'IronLink v2.1.4', Colors.white),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0xFF1E2128), height: 1)),
                _buildInfoRow('Entorno', 'UGB Campus Central', Colors.white),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0xFF1E2128), height: 1)),
                _buildInfoRow('Protocolo VPN', 'WireGuard • AES-256', AppColors.textSecondary),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0xFF1E2128), height: 1)),
                _buildInfoRow('Última sincronía', 'Hoy 09:52 AM', AppColors.accent),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.description, color: Colors.white, size: 16),
                        label: const Text('Términos', style: TextStyle(color: Colors.white)),
                        style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFF2A2D35))),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.bug_report, color: Colors.amber, size: 16),
                        label: const Text('Reportar', style: TextStyle(color: Colors.white)),
                        style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFF2A2D35))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppearanceOption(String title, String subtitle, String btnText, Color iconColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: AppColors.textTertiary, fontSize: 12)),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1C23),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF2A2D35)),
          ),
          child: Row(
            children: [
              Icon(Icons.circle, color: iconColor, size: 12),
              const SizedBox(width: 8),
              Text(btnText, style: const TextStyle(color: Colors.white, fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }

  // --- SEGURIDAD ---
  Widget _buildSeguridadPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Seguridad de la cuenta', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Gestiona tus credenciales y accesos activos', style: TextStyle(color: AppColors.textTertiary, fontSize: 14)),
        const SizedBox(height: 32),
        
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column (Correo / 2FA)
            Expanded(
              child: Column(
                children: [
                  _buildPanelContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.email, color: Colors.blueAccent, size: 20),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Correo electrónico', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                Text('Cambiar dirección de acceso', style: TextStyle(color: AppColors.textTertiary, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        const Text('CORREO ACTUAL', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, letterSpacing: 1.5)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: const Color(0xFF171A21), borderRadius: BorderRadius.circular(8)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('w.ramirez@ugb.edu.sv', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                              Row(
                                children: [
                                  Icon(Icons.check, color: AppColors.accent, size: 14),
                                  SizedBox(width: 4),
                                  Text('Verificado', style: TextStyle(color: AppColors.accent, fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text('NUEVO CORREO', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, letterSpacing: 1.5)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: const Color(0xFF171A21), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFF1E2128))),
                          child: const Text('correo@nuevo.com', style: TextStyle(color: AppColors.textTertiary, fontSize: 14)),
                        ),
                        const SizedBox(height: 8),
                        const Text('Se enviará un enlace de confirmación al nuevo correo', style: TextStyle(color: AppColors.textTertiary, fontSize: 11)),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.mail, color: Colors.black, size: 16),
                            label: const Text('Enviar verificación', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, padding: const EdgeInsets.symmetric(vertical: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildPanelContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.shield, color: Colors.redAccent, size: 20),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Verificación en dos pasos', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                Text('Protección adicional de la cuenta', style: TextStyle(color: AppColors.textTertiary, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        _buildSwitchRow('Autenticación 2FA', 'Código extra al iniciar sesión', _auth2fa, (v) => setState(() => _auth2fa = v)),
                        const SizedBox(height: 16),
                        _buildSwitchRow('Notificar nuevos accesos', 'Alerta si inician sesión desde otro dispositivo', _notifAccesos, (v) => setState(() => _notifAccesos = v)),
                        const SizedBox(height: 16),
                        _buildSwitchRow('Recordar dispositivos de confianza', 'No pedir 2FA en este equipo por 30 días', _recordarDispositivos, (v) => setState(() => _recordarDispositivos = v)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            
            // Right Column (Contraseña / Sesiones)
            Expanded(
              child: Column(
                children: [
                  _buildPanelContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.key, color: Colors.amber, size: 20),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Contraseña', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                Text('Actualizar clave de acceso', style: TextStyle(color: AppColors.textTertiary, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        const Text('CONTRASEÑA ACTUAL', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, letterSpacing: 1.5)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: const Color(0xFF171A21), borderRadius: BorderRadius.circular(8)),
                          child: const Text('••••••••', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                        ),
                        const SizedBox(height: 24),
                        const Text('NUEVA CONTRASEÑA', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, letterSpacing: 1.5)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: const Color(0xFF171A21), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFF1E2128))),
                          child: const Text('Mínimo 8 caracteres', style: TextStyle(color: AppColors.textTertiary, fontSize: 14)),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(child: Container(height: 4, color: Colors.amber)),
                            const SizedBox(width: 4),
                            Expanded(child: Container(height: 4, color: Colors.amber)),
                            const SizedBox(width: 4),
                            Expanded(child: Container(height: 4, color: const Color(0xFF2A2D35))),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text('Seguridad: Media', style: TextStyle(color: Colors.amber, fontSize: 11)),
                        const SizedBox(height: 24),
                        const Text('CONFIRMAR CONTRASEÑA', style: TextStyle(color: AppColors.textTertiary, fontSize: 11, letterSpacing: 1.5)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: const Color(0xFF171A21), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFF1E2128))),
                          child: const Text('Repite la contraseña', style: TextStyle(color: AppColors.textTertiary, fontSize: 14)),
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.lock_reset, color: Colors.black, size: 16),
                            label: const Text('Actualizar contraseña', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, padding: const EdgeInsets.symmetric(vertical: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildPanelContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.devices, color: Colors.grey, size: 20),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Sesiones activas', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                    Text('Dispositivos con acceso a tu cuenta', style: TextStyle(color: AppColors.textTertiary, fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.logout, color: Colors.redAccent, size: 14),
                              label: const Text('Cerrar todas', style: TextStyle(color: Colors.redAccent, fontSize: 12)),
                              style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.redAccent.withOpacity(0.3))),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        _buildSessionItem(Icons.laptop_windows, 'Windows 11 • Chrome 124', 'San Salvador • Hace 2 min', true),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0xFF1E2128), height: 1)),
                        _buildSessionItem(Icons.phone_android, 'Android 14 • App IronLink', 'San Miguel • Hace 3 h', false),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0xFF1E2128), height: 1)),
                        _buildSessionItem(Icons.laptop_mac, 'macOS Sonoma • Safari 17', 'Usulután • Hace 1 día', false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSessionItem(IconData icon, String title, String subtitle, bool isCurrent) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: const Color(0xFF171A21), borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(color: AppColors.textTertiary, fontSize: 11)),
            ],
          ),
        ),
        if (isCurrent)
          const Text('Sesión actual', style: TextStyle(color: AppColors.accent, fontSize: 12, fontWeight: FontWeight.bold))
        else
          const Text('Cerrar', style: TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Helpers
  Widget _buildPanelContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E2128)),
      ),
      child: child,
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: AppColors.textTertiary, fontSize: 12)),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.accent,
          inactiveTrackColor: const Color(0xFF1E2128),
        ),
      ],
    );
  }
}
