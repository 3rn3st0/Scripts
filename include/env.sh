#--
# setEnvironment     Inicializa las variables de de entorno de todos los scripts
#
set -o errexit                                                          # Detiene el script cuando ocurre un error
set -o pipefail                                                         # Ocurre cuando hay un error cuando se envía un resultado usando una tubería
set -o nounset                                                          # Detecta variables NO inicializadas y sale con un error
#set -o xtrace                                                          # Imprime/muestra cada expresión antes de ejecutarla, ideal para debugging

declare -g CERO=0
declare -g UNO=1
declare -g AUTHORNAME="Ernesto L. Chapon R."
declare -g AUTHORNICK="3rn3st0"
