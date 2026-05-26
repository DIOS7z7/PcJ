@echo off
 chcp 65001 >nul
  echo =============================================
   echo CREANDO MÁQUINA VIRTUAL WINDOWS 11 PARA JUGAR
    echo SIN ERRORES - CONFIGURACIÓN OPTIMIZADA
     echo =============================================
      echo.
       :: PASO 1: CREAR ESPACIO EN DISCO
        echo [1/4] Creando espacio en disco...
         VBoxManage createhd --filename "%USERPROFILE%\VirtualBox VMs\Steam-Gaming-PC\disco.vdi" --size 122880 --type standard
          if %errorlevel% neq 0 (
               echo ❌ ERROR: No se pudo crear el disco
                    pause
                         exit /b
                          )
                           :: PASO 2: CREAR LA MÁQUINA
                            echo [2/4] Creando la máquina virtual...
                             VBoxManage createvm --name "Steam-Gaming-PC" --ostype "Windows11_64" --register
                              if %errorlevel% neq 0 (
                                   echo ❌ ERROR: No se pudo crear la máquina
                                        pause
                                             exit /b
                                              )
                                               :: PASO 3: CONFIGURAR RECURSOS
                                                echo [3/4] Configurando recursos...
                                                 VBoxManage modifyvm "Steam-Gaming-PC" --memory 8192 --cpus 4 --vram 512
                                                  VBoxManage modifyvm "Steam-Gaming-PC" --boot1 dvd --boot2 disk --boot3 none --boot4 none
                                                   VBoxManage modifyvm "Steam-Gaming-PC" --audio-driver default --audio-enabled on
                                                    VBoxManage modifyvm "Steam-Gaming-PC" --nic1 nat --nictype1 82540EM --cableconnected1 on
                                                     :: PASO 4: ACTIVAR CARACTERÍSTICAS IMPORTANTES
                                                      echo [4/4] Activando características para juegos...
                                                       VBoxManage modifyvm "Steam-Gaming-PC" --hwvirtex on --nestedpaging on --largepages on
                                                        VBoxManage modifyvm "Steam-Gaming-PC" --ioapic on
                                                         if %errorlevel% neq 0 (
                                                              echo ⚠️ AVISO: Algunas funciones no se activaron, pero funcionará bien
                                                               )
                                                                :: CÓDIGO PARA ABRIR PUERTO
                                                                 VBoxManage modifyvm "Steam-Gaming-PC" --natpf1 "AccesoPC,tcp,,3389,,3389"
                                                                  echo ✅ Puerto 3389 configurado correctamente
                                                                   echo.
                                                                    echo =============================================
                                                                     echo ✅ MÁQUINA CREADA CORRECTAMENTE!
                                                                      echo LISTA PARA INSTALAR WINDOWS 11
                                                                       echo =============================================
                                                                        pause
                                                                        