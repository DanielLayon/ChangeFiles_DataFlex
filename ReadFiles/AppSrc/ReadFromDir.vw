Use Windows.pkg
Use DFClient.pkg
Use cLinkLabel.pkg
//Use DF_Library.pkg



Deferred_View Activate_oReadFromDir for ;
Object oReadFromDir is a dbView
    
    // ToDo: Aperfeiáoar para pegar apenas o Path - DANIEL LAYON
    Object oOpenDialog1 is a OpenDialog
        Set Dialog_Caption to "Selecione o Path de leitura"
        Set Initial_Folder to "C:\"
        Set FileMustExist_State to False
    End_Object

    Set Border_Style to Border_None
    Set Size to 140 300
    Set Location to 2 2
    Set Label to "ReadFromDir"
    Set piMinSize to 140 300
    Set piMaxSize to 140 300
    Set Minimize_Icon to False
    Set Caption_Bar to False

    Object oFormPath is a Form
         Set Size to 13 286
        Set Location to 41 7
        Set Label to "Path de Leitura"
        Set Label_Justification_Mode to JMode_Top
        Set Label_Col_Offset to 0
        Set Prompt_Button_Mode to PB_PromptOn
        Set Value to "C:\Path\"
        
        Procedure Prompt
            Forward Send Prompt
            Boolean bOk
            String[] sSelectedPath
        
            Get Show_Dialog of oOpenDialog1 to bOk
            If (bOk) Begin
                Get Selected_Files of oOpenDialog1 to sSelectedPath
                Set Value to sSelectedPath[0]
            End
        End_Procedure
        
    End_Object

    Object oFormExt is a Form
         Set Size to 13 55
        Set Location to 119 7
        Set Label to "Extens∆o (MIME)"
        Set Label_Justification_Mode to JMode_Top
        Set Label_Col_Offset to 0
        Set Value to ".html"
        
    End_Object

    Object oFormPastValue is a Form
         Set Size to 13 286
        Set Location to 68 7
        Set Label to "Linha com valor atual"
        Set Label_Justification_Mode to JMode_Top
        Set Label_Col_Offset to 0
        Set Value to "Colar linha que deseja substituir"
        
        Procedure Prompt
            Forward Send Prompt
            Boolean bOk
            String[] sSelectedPath
        
            Get Show_Dialog of oOpenDialog1 to bOk
            If (bOk) Begin
                Get Selected_Files of oOpenDialog1 to sSelectedPath
                Set Value to sSelectedPath[0]
            End
        End_Procedure
        
    End_Object

    Object oFormNewValue is a Form
         Set Size to 13 286
        Set Location to 95 7
        Set Label to "Linha com novo valor "
        Set Label_Justification_Mode to JMode_Top
        Set Label_Col_Offset to 0
        Set Value to "Novo valor desejado"
        
        Procedure Prompt
            Forward Send Prompt
            Boolean bOk
            String[] sSelectedPath
        
            Get Show_Dialog of oOpenDialog1 to bOk
            If (bOk) Begin
                Get Selected_Files of oOpenDialog1 to sSelectedPath
                Set Value to sSelectedPath[0]
            End
        End_Procedure
        
    End_Object

    Object oTextBoxTitle is a TextBox
        Set Size to 9 40
        Set Location to 8 106
        Set Justification_Mode to JMode_Right
        Set FontPointHeight to 20
        Set Label to "Change Files"
        Set FontWeight to fw_Bold
    End_Object
    
    Object oButton1 is a Button
        Set Size to 14 36
        Set Location to 120 255
        Set Label to 'GO!'
        Set peAnchors to anTopRight
        
        // fires when the button is clicked
        Procedure OnClick
            String sFileName sRow
            String sExt sPath sPastValue sNewValue
            
            Get Value of oFormPath      to sPath
            Get Value of oFormExt       to sExt
            Get Value of oFormPastValue to sPastValue
            Get Value of oFormNewValue  to sNewValue
                        
            Direct_Input channel 9 ("dir:"+sPath)
                Repeat
                    Readln channel 9 sFileName

                    If (sFileName contains sExt) Begin
                        
                        Send p_ReadWrite (sPath + sFileName) sPastValue sNewValue
                        
                        Send Info_Box "Arquivos alterados com sucesso" "Sucesso"   
                    End //If (sFileName contains ".xml") Begin
                    
                Until (SeqEof)
            Close_Input  channel 9        
        End_Procedure
    
    End_Object
    
Cd_End_Object

Procedure p_ReadWrite String sPath String sOldValue String sNewValue
    String sReading
    String[] sFileValues
    Integer iX
    
    Direct_Input channel 1 sPath
            
            Move 0 to iX
            Repeat                
                Readln channel 1 sReading
                
                If  (sReading contains sOldValue) Move sNewValue to sFileValues[iX]
                Else Move sReading to sFileValues[iX]
                
                Increment iX
            Until (SeqEof)
            Move 0 to iX
                        
    Close_Input channel 1
    
    Direct_Output channel 2 sPath
        For iX from 0 to (SizeOfArray(sFileValues) - 1)
            Writeln channel 2 sFileValues[iX]
        Loop
    Close_Output channel 2   
    
End_Procedure