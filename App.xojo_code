#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  //  Checks for existing SQLite databases.  If found, continues to main window.  Otherwise we need to create a database to store our cool ideas.
		  
		  Dim dbFile As FolderItem
		  Dim db As New SQLiteDatabase
		  dbFile = GetFolderItem("reference_data.sqlite")
		  db.DatabaseFile = dbFile
		  If db.Connect Then
		    powerFactor_main.Show
		    Return
		  Else 
		    Dim f As FolderItem
		    f = New FolderItem("reference_data.sqlite")
		    
		    Dim dbase As New SQLiteDatabase
		    dbase.DatabaseFile = f
		    If dbase.CreateDatabaseFile Then
		      dbase.SQLExecute("CREATE TABLE reference ( id_reference INTEGER PRIMARY KEY, division TEXT , bullet_weight INTEGER, fps INTEGER);")
		    Else
		      MsgBox("Database not created. Error: " + dbase.ErrorMessage)
		    End If
		  End If
		  
		  
		  //// populate reference database with source data
		  //Dim divisions New Xojo.Core.Dictionary
		  //divisions.Value("division") = "CDP"
		  //divisions.Value("division") = "ESP"
		  //divisions.Value("division") = "SSP"
		  //divisions.Value("division") = "CCP"
		  //divisions.Value("division") = "REV"
		  //divisions.Value("division") = "BUG"
		  //divisions.Value("division") = "PCC"
		  
		  //Dim r As FolderItem
		  //Dim dbr As New SQLiteDatabase
		  //dbrFile = GetFolderItem("reference_data.sqlite")
		  //dbr.DatabaseFile = dbrFile
		  //If dbr.Connect Then
		  //Dim fps As Variant
		  //Dim pf As Integer
		  //
		  //For Each division As Xojo.Core.DictionaryEntry In divisions
		  //For i As Integer = 89 To 300
		  
		  //// determine if weight bullet qualifies for division by calculating FPS to meet power factor
		  //Dim Floor As Integer
		  //If division = "CDP Then
		  //Floor = 165
		  //Elseif division = "ESP" Then
		  //Floor = 125
		  //Elseif division = "SSP" Then
		  //Floor = 125
		  //Elseif division = "CCP" Then
		  //Floor = 125
		  //Elseif division = "BUG" Then
		  //Floor = 95
		  //Elseif division = "PCC" Then
		  //Floor = 125
		  //Elseif division = "REV" Then
		  //Floor = 105
		  //End If
		  //
		  //
		  //If db.Connect Then
		  //db.SQLExecute("BEGIN TRANSACTION;")
		  //db.SQLExecute ("INSERT INTO reference (division, bullet_weight, fps ) VALUES " + "( "+ division +","+ i +","+  fps +");")
		  //If db.Error Then
		  //MsgBox("Error: " + db.ErrorMessage)
		  //db.Rollback
		  //Else
		  //db.Commit
		  //End If
		  //
		  //
		  //
		  //Next
		  //Next
		  //
		  //
		  //
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


End Class
#tag EndClass
