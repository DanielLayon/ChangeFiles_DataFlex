// Person.sl
// Person Lookup List

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use cPersonDataDictionary.dd

CD_Popup_Object Person_sl is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 432
    Set Label To "Person Lookup List"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oPerson_DD is a cPersonDataDictionary
    End_Object 

    Set Main_DD To oPerson_DD
    Set Server  To oPerson_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 422
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "Person_sl_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oPerson_ID is a cDbCJGridColumn
            Entry_Item Person.ID
            Set piWidth to 147
            Set psCaption to "Id"
        End_Object 

        Object oPerson_FIRST_NAME is a cDbCJGridColumn
            Entry_Item Person.FIRST_NAME
            Set piWidth to 262
            Set psCaption to "name"
        End_Object 

        Object oPerson_LAST_NAME is a cDbCJGridColumn
            Entry_Item Person.LAST_NAME
            Set piWidth to 262
            Set psCaption to "last name"
        End_Object 

        Object oPerson_AGE is a cDbCJGridColumn
            Entry_Item Person.AGE
            Set piWidth to 49
            Set psCaption to "Age"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 269
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 323
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 377
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // Person_sl
