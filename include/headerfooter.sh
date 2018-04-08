#--
# setColors     Inicializa las variables de colores y atributos de texto
#
function showHeader() {
    printf "\n"
    printf "   ${FVRDE}$SCRIPTNAME${SCLR} versión ${FAMAR}${VERSION}${SCLR} por ${FVRDE}${AUTHORNAME}${SCLR}"
    printf "\n"
}

function showFooter() {
    printf "\n\n"
    printf "   ${FVRDE}$SCRIPTNAME${SCLR} versión ${FAMAR}${VERSION}${SCLR}. Copyright ${COPYRIGHT} ${FVRDE}${AUTHORNAME}${SCLR} | Licencia ${FVRDE}${LICENCE}${SCLR}"
    printf "\n"
}
