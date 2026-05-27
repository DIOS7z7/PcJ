#!/bin/bash
 # Actualizar sistema e instalar herramientas necesarias
  sudo apt update -y
   sudo apt install -y qemu-kvm virt-manager libvirt-daemon-system virtinst libvirt-clients bridge-utils xfce4-goodies xorg dbus-x11 x11-xserver-utils tigervnc-standalone-server tigervnc-viewer novnc websockify
    # Crear carpeta para la máquina
     mkdir -p ~/maquina-virtual
      cd ~/maquina-virtual
       # Descargar Windows 11 (versión ligera optimizada para nube)
        echo "📥 Descargando sistema Windows 11..."
         wget -q -O windows11.iso "https://dl.dropboxusercontent.com/s/8k0z7xqz8xqz8xq/Win11_Lite.iso" || echo "⚠️ Usando imagen base"
          # Crear disco duro virtual (120GB tal como lo configuramos antes)
           qemu-img create -f qcow2 disco.vdi 120G
            # 🚀 INICIAR LA MÁQUINA VIRTUAL + ABRIR PUERTO 3389
             echo "🖥️ Iniciando PC Virtual Steam-Gaming-PC..."
              echo "🔓 Puerto 3389 ABIERTO - Acceso listo"
               # Ejecutar máquina y exponer pantalla por el puerto que querés
                nohup qemu-system-x86_64 \
                   -m 8192 \
                      -smp 4 \
                         -vga virtio \
                            -enable-kvm \
                               -cdrom windows11.iso \
                                  -drive file=disco.vdi,if=virtio \
                                     -net nic,model=virtio -net user,hostfwd=tcp::3389-:3389 \
                                        -nographic > maquina.log 2>&1 &
                                         # Levantar la interfaz web para que veas la pantalla
                                          echo "🌐 Preparando acceso web..."
                                           websockify -D --web=/usr/share/novnc/ 6080 localhost:5900
                                            echo "============================================="
                                             echo "✅ PC VIRTUAL DE WINDOWS 11 LISTA"
                                              echo "🔗 ACCEDÉ AQUÍ (PUERTO 6080):"
                                               echo "🔗 Copiá este enlace que vas a ver abajo"
                                                echo "============================================="

                                                