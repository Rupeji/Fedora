set fish_greeting

# Añadir binarios compartidos del sistema
fish_add_path "/usr/bin"

# Inicializar Starship Prompt nativo
if command -v starship > /dev/null
    starship init fish | source
end

# Abreviaciones útiles para gestionar Fedora 45 cómodamente
abbr -a actualizar-flatpak 'flatpak update -y'
abbr -a limpieza           'flatpak uninstall --unused -y && sudo dnf autoremove -y && sudo dnf clean all'
abbr -a comprobar-actualizaciones 'sudo dnf check-update'
abbr -a reparar            'sudo dnf clean metadata && sudo dnf makecache'

# NOTA: Las abreviaciones 'mantenimiento' y 'actualizar-sistema' han sido eliminadas.
# Ahora 'mantenimiento' ejecuta el script real en /usr/local/bin/mantenimiento

# Función para listar los comandos personalizados
function comandos --description "Muestra la lista de alias personalizados y su explicación"
    echo (set_color --bold blue)"=== COMANDOS PERSONALIZADOS ==="(set_color normal)
    echo (set_color green)"mantenimiento             "(set_color normal)": Script del sistema que requiere SUDO. Actualiza Fedora, Flatpaks, recompila NVIDIA, limpia kernels viejos y caché."
    echo (set_color green)"actualizar-flatpak        "(set_color normal)": Actualiza únicamente los Flatpaks de forma manual si tienes prisa."
    echo (set_color green)"comprobar-actualizaciones "(set_color normal)": Comprueba si hay actualizaciones pendientes sin instalarlas."
    echo (set_color green)"limpieza                  "(set_color normal)": Limpieza rápida de residuos de Flatpak y paquetes huérfanos."
    echo (set_color green)"reparar                   "(set_color normal)": Soluciona problemas de caché de DNF si falla alguna actualización."
end

# Ejecutar Fastfetch al abrir la terminal si está instalado
if command -v fastfetch > /dev/null
    fastfetch
end
