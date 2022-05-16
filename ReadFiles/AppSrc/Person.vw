// C:\DataFlex Projects\ReadFiles\AppSrc\Person.vw
// Person
//

Use DFClient.pkg
Use DFEntry.pkg

Use cPersonDataDictionary.dd
Use Windows.pkg

Use Person.sl

ACTIVATE_VIEW Activate_oPerson FOR oPerson
Object oPerson is a dbView
    Set Location to 5 5
    Set Size to 38 706
    Set Label To "Person"
    Set Border_Style to Border_Thick


    Object oPerson_DD is a cPersonDataDictionary
    End_Object 

    Set Main_DD To oPerson_DD
    Set Server  To oPerson_DD



    Object oPersonID is a dbForm
        Entry_Item Person.ID
        Set Size to 13 90
        Set Location to 5 35
        Set peAnchors to anLeftRight
        Set Label to "Id pessoa"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 30
        Set Label_row_Offset to 0
    End_Object 

    Object oPersonFIRST_NAME is a dbForm
        Entry_Item Person.FIRST_NAME
        Set Size to 13 250
        Set Location to 5 163
        Set peAnchors to anRight
        Set Label to "First name"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 33
        Set Label_row_Offset to 0
    End_Object 

    Object oPersonLAST_NAME is a dbForm
        Entry_Item Person.LAST_NAME
        Set Size to 13 250
        Set Location to 5 451
        Set peAnchors to anRight
        Set Label to "Last name"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 33
        Set Label_row_Offset to 0
    End_Object 

    Object oPersonAGE is a dbForm
        Entry_Item Person.AGE
        Set Size to 13 34
        Set Location to 20 35
        Set peAnchors to anLeftRight
        Set Label to "Age"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 30
        Set Label_row_Offset to 0
    End_Object 

    Object oButton1 is a Button
        Set Location to 19 81
        Set Label to 'oButton1'
    
        // fires when the button is clicked
        Procedure OnClick
            
        End_Procedure
    
    End_Object


End_Object 
