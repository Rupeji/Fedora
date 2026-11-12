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
abbr -a mantenimiento 'sudo akmods --force && flatpak update -y'
abbr -a comprobar-actualizaciones 'sudo dnf check-update'
abbr -a actualizar-sistema 'sudo dnf upgrade --refresh && flatpak update -y'
abbr -a reparar            'sudo dnf clean metadata && sudo dnf makecache'
abbr -a actualizar-todo    'topgrade'

# Función para listar los comandos personalizados
function comandos --description "Muestra la lista de alias personalizados y su explicación"
    echo (set_color --bold blue)"=== COMANDOS PERSONALIZADOS ==="(set_color normal)
    echo (set_color green)"actualizar-flatpak        "(set_color normal)": Actualiza únicamente los Flatpaks de forma manual si tienes prisa."
    echo (set_color green)"comprobar-actualizaciones "(set_color normal)": AComprueba si hay actualizaciones pendientes sin instalarlas."
    echo (set_color green)"limpieza                  "(set_color normal)": Limpieza profunda de residuos tanto de apps de usuario como del sistema."
    echo (set_color green)"actualizar-sistema        "(set_color normal)": Descarga y prepara la última versión de tu ISO de GitHub (requiere reiniciar)."
    echo (set_color green)"reparar                   "(set_color normal)": Soluciona el problema si falla la actualización y permite continuar la descarga donde se quedó."
    echo (set_color green)"mantenimiento        "(set_color normal)": Sincroniza los drivers y flatpaks."
    echo (set_color green)"actualizar-todo           "(set_color normal)": Actualiza la ISO y todo lo demás que tenga instalado de un solo golpe."
end

# Ejecutar Fastfetch al abrir la terminal si está instalado
if command -v fastfetch > /dev/null
    fastfetch
end
