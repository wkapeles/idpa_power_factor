#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  //  Checks for existing SQLite databases.  If found, continues to main window.  Otherwise we need to create a database to store our cool ideas.
		  
		  Dim dbFile As FolderItem
		  Dim db As New SQLiteDatabase
		  dbFile = GetFolderItem("shooter_data.sqlite")
		  db.DatabaseFile = dbFile
		  If db.Connect Then
		    powerFactor_main.Show
		    Return
		  Else 
		    Dim f As FolderItem
		    f = New FolderItem("shooter_data.sqlite")
		    
		    Dim dbase As New SQLiteDatabase
		    dbase.DatabaseFile = f
		    If dbase.CreateDatabaseFile Then
		      dbase.SQLExecute("CREATE TABLE results ( id_reference INTEGER PRIMARY KEY, last_name TEXT, first_name TEXT, idpa_number TEXT, division TEXT , bullet_weight INTEGER, test1 INTEGER, test2 INTEGER, test3 INTEGER , pass TEXT );")
		    Else
		      MsgBox("Database not created. Error: " + dbase.ErrorMessage)
		    End If
		  End If
		  
		  
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


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
