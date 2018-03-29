#--
# setColors     Inicializa las variables de colores y atributos de texto
#
function setColors() {
    # Definición de atributos del texto
    declare -g BOLD=$(tput bold)                                        # Negritas / Brillo
    declare -g SHNG=$(tput dim)                                         # Encendido de medio brillo
    declare -g UDRL=$(tput smul)                                        # Inicio subrayado
    declare -g LRDU=$(tput rmul)                                        # Fin subrayado
    declare -g RVRS=$(tput rev)                                         # Encendido negativo
    declare -g SCLR=$(tput sgr 0)                                       # Resetea todos los atributos

    # Definición de colores de primer plano
    # (setaf = Set ANSI Foreground)
    declare -g FNGRO=$(tput setaf 0)                                    # Negro
    declare -g FROJO=$(tput setaf 1)                                    # Rojo
    declare -g FVRDE=$(tput setaf 2)                                    # Verde
    declare -g FAMAR=$(tput setaf 3)                                    # Amarillo
    declare -g FAZUL=$(tput setaf 4)                                    # Azul
    declare -g FMGTA=$(tput setaf 5)                                    # Magenta
    declare -g FCYAN=$(tput setaf 6)                                    # Cyan
    declare -g FBLCO=$(tput setaf 7)                                    # Blanco

    # Definición de colores de segundo plano
    # (setaf = Set ANSI Background)
    declare -g BNGRO=$(tput setab 0)                                    # Negro
    declare -g BROJO=$(tput setab 1)                                    # Rojo
    declare -g BVRDE=$(tput setab 2)                                    # Verde
    declare -g BAMAR=$(tput setab 3)                                    # Amarillo
    declare -g BAZUL=$(tput setab 4)                                    # Azul
    declare -g BMGTA=$(tput setab 5)                                    # Magenta
    declare -g BCYAN=$(tput setab 6)                                    # Cyan
    declare -g BBLCO=$(tput setab 7)                                    # Blanco
}
