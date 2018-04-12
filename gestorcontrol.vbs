' ------------------------------------------------------------------------------
' Script     : gestorcontrol.vbs
' Description: Permite leer el registro de Windows y verificar si la
'              variable de entorno «SAFE» existe y crearla/modificarla
'              si hace falta.
' Author     : Ernesto L. Chapon R. aka 7ur3c0
' Created    : 2018-02-01
' Updated    : 2018-02-06
' Version    : 1.0.0b
' ------------------------------------------------------------------------------
Option Explicit

Const T_STRING = 8
Const R_KEY = "HKCU\Environment\SAFE"                                           ' HKCU --> HKEY_CURRENT_USER

Dim WshShell, strSafeKey, sMsg, iOp, sTit
Dim K_ADM, K_INT, K_AMI, K_EMI, K_IMI, K_OMI, K_UMI, K_NMI
Dim ERR_GCNE_NRO, ERR_GCNE_SRC, ERR_GCNE_DSC
Dim ERR_GCCK_NRO, ERR_GCCK_DSC
Dim ERR_GCMD_NRO, ERR_GCMD_DSC

K_ADM = ChrW(0161)                                                              ' Signo de admiración abierto
K_INT = ChrW(0191)                                                              ' Signo de interrogación abierto
K_AMI = ChrW(0225)                                                              ' á
K_EMI = ChrW(0233)                                                              ' é
K_IMI = ChrW(0237)                                                              ' í
K_OMI = ChrW(0243)                                                              ' ó
K_UMI = ChrW(0250)                                                              ' ú
K_NMI = ChrW(0241)                                                              ' ñ

' Errores genéricos del script
ERR_GCNE_SRC = "Gestor de Control"

ERR_GCNE_NRO = 35666
ERR_GCNE_DSC = "El Gestor de Control no ha sido encontrado o se encuentra da" & K_NMI & "ado/corrompido"
ERR_GCCK_NRO = 35667
ERR_GCCK_DSC = "No se pudo crear el Gestor de Control"
ERR_GCMD_NRO = 35668
ERR_GCMD_DSC = "No se pudo corregir/modificar el Gestor de Control"

' Inicializo el manejo de errores
Err.Clear
On Error Resume Next

' Objeto Windows Shell
Set WshShell = WScript.CreateObject("WScript.Shell")

' Si se produce un error al leer la clave del registro...
' Leo la clave del Registro de Windows
strSafeKey = WshShell.RegRead(R_KEY)

If VarType(strSafeKey) <> T_STRING Or Len(strSafeKey) < 1 Then
    Err.Clear
    Call Err.Raise(ERR_GCNE_NRO, ERR_GCNE_SRC, ERR_GCNE_DSC)
    sMsg = "Se ha producido un error al momento de " & _
           "capturar el valor del Gestor de Control de SAFE." & vbCrLf & vbCrLf & _
           "Error: " & Err.Number & vbCrLf & _
           "Origen: " & Err.Source & vbCrLf & _
           "Descripci" & K_OMI & "n: " & Err.Description & vbCrLf & vbCrLf & _
           "Puede resolver el problema creando o corrigiendo el valor del gestor de control de SAFE." & vbCrLf & vbCrLf & _
           K_INT & "Desea crear/corregir el gestor de control de SAFE?"
    sTit = K_ADM & "Error del Gestor de Control!"

    iOp = MsgBox(sMsg, vbYesNo + vbExclamation, sTit)

    if iOp = vbYes Then
        CreateSafeRegKey()
        ModifySafeRegKey()
    Else
        CloseScript()
    End If
Else
    sMsg = "SAFE contiene el valor: " & strSafeKey & vbCrLf & vbCrLf & _
           K_INT & "Desea modificarla?"

    iOp = MsgBox(sMsg, vbYesNo + vbExclamation, K_ADM & "Alerta!")

    If iOp = vbYes Then
        ModifySafeRegKey()
    Else
        CloseScript("")
    End If
End If
'-------------------------------------------------------------------------------
Private Function CreateSafeRegKey()
    Err.Clear
    WshShell.RegWrite R_KEY & "\", "", "REG_SZ"

    If Err.Number <> 0 Then
        Err.Clear
        Call Err.Raise(ERR_GCCK_NRO, ERR_GCNE_SRC, ERR_GCCK_DSC)
        sMsg = K_ADM & "Se ha producido un error al momento de " & _
               "crear el gestor de control!" & vbCrLf & vbCrLf & _
               "Error: " & Err.Number & vbCrLf & _
               "Origen: " & Err.Source & vbCrLf & _
               "Descripci" & K_OMI & "n: " & Err.Description & vbCrLf & vbCrLf & _
               "Por favor comunique este error a soporte técnico de Solumak."
        sTit = K_ADM & "Error del Gestor de Control!"

        iOp = MsgBox(sMsg, vbExclamation, sTit)
    End If
End Function
'-------------------------------------------------------------------------------
Private Function ModifySafeRegKey()
    Dim strSafeValue

    Err.Clear
    strSafeValue = InputBox("Introduzca el nuevo valor para SAFE:")
    WshShell.RegWrite R_KEY, strSafeValue, "REG_SZ"

    If Err.Number <> 0 Then
        Err.Clear
        Call Err.Raise(ERR_GCMD_NRO, ERR_GCNE_SRC, ERR_GCMD_DSC)
        sMsg = K_ADM & "Se ha producido un error al momento de " & _
               "corregir/cambiar el valor del gestor de control!" & vbCrLf & vbCrLf & _
               "Error: " & Err.Number & vbCrLf & _
               "Origen: " & Err.Source & vbCrLf & _
               "Descripci" & K_OMI & "n: " & Err.Description & vbCrLf & vbCrLf & _
               "Por favor comunique este error a soporte técnico de Solumak."
        sTit = K_ADM & "Error del Gestor de Control!"

        iOp = MsgBox(sMsg, vbExclamation, sTit)
    Else
        sMsg = "Se modific" & K_OMI & " exitosamente el Gestor de Control." & vbCrLf & vbCrLf & _
               K_ADM & "Gracias por usar las herramientas de automatizaci" & K_OMI & "n de Solumak!"
        CloseScript(sMsg)
    End If
End Function
'-------------------------------------------------------------------------------
Private Function CloseScript(sSuccess)
    If Len(sSuccess) < 1 Or VarType(sSuccess) <> T_STRING Then
        sMsg = "Gracias por usar las herramientas de automatizaci" & K_OMI & _
               "n de Solumak. Esperamos que le hayan resultado " & K_UMI & "tiles."
    Else
        sMsg = sSuccess
    End If

    iOp = MsgBox(sMsg, vbInformation, K_ADM & "Hasta luego!")

    Set WshShell = Nothing
    WScript.Quit
End Function