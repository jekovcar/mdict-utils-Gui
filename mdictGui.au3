﻿#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=mdict.ico
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Description=mdict-utils winGui on AutoIt
#AutoIt3Wrapper_Res_Fileversion=1.0.0
#AutoIt3Wrapper_Res_ProductName=mdictGui
#AutoIt3Wrapper_Res_ProductVersion=1.0.0
#AutoIt3Wrapper_Res_CompanyName=jekovcar
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <FileConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPIShPath.au3>
#include <File.au3>

MDictGUI()

Func MDictGUI()
	$hGUI1 = GUICreate("mdictGui 1.0.0", 792, 641, 192, 125)

	$iButtonMdict = GUICtrlCreateButton("Mdict", 409, 64, 40, 25)
	GUICtrlSetTip(-1, "Select Mdict.exe")
	$Mdict = GUICtrlCreateEdit("", 454, 64, 244, 48, BitOR($ES_MULTILINE, $ES_READONLY))
	GUICtrlSetTip(-1, "Path of mdict-utils")
	$idButton_Descr = GUICtrlCreateButton("Descripton", 45, 64, 80, 22)
	$ButtonDview = GUICtrlCreateButton("View", 92, 88, 33, 20)
	GUICtrlSetBkColor(-1, 0xFFFBF0)
	GUICtrlSetTip(-1, "Edit Descripton")
	$ButtonDclean = GUICtrlCreateButton("Clean", 53, 88, 33, 20)
	GUICtrlSetState($ButtonDview, 32)
	GUICtrlSetState($ButtonDclean, 32)
	$idButton_upd = GUICtrlCreateButton("GuiUpdate", 712, 16, 60, 24)
	GUICtrlSetTip(-1, "GitHub mdictGui")
	$idButton_vers = GUICtrlCreateButton("MdictTest", 712, 86, 60, 24)
	GUICtrlSetTip(-1, "Test Mdict-utils & Python versions")
	$idButton_pypi = GUICtrlCreateButton("MdictUpd", 712, 50, 60, 24)
	GUICtrlSetTip(-1, "pypi.org/project/mdict-utils/")
	$Descr = GUICtrlCreateEdit("File Descripton", 134, 64, 260, 45, BitOR($ES_MULTILINE, $ES_READONLY))
	$Title = GUICtrlCreateEdit("File Title", 134, 11, 260, 45, BitOR($ES_MULTILINE, $ES_READONLY))
	$iButtonTitle = GUICtrlCreateButton("Title", 45, 12, 80, 22)
	$ButtonTview = GUICtrlCreateButton("View", 92, 36, 33, 20)
	GUICtrlSetTip(-1, "Edit Title")
	GUICtrlSetBkColor(-1, 0xFFFBF0)
	$ButtonTclean = GUICtrlCreateButton("Clean", 53, 36, 33, 20)
	GUICtrlSetState($ButtonTview, 32)
	GUICtrlSetState($ButtonTclean, 32)

	$GroupPackMDX = GUICtrlCreateGroup("Pack MDX / Convert TXT to Sqlite3DB", 24, 112, 393, 98)
	$idButton_BrowseUnp = GUICtrlCreateButton("Select MTXT", 45, 130, 80, 22)
	$Unp = GUICtrlCreateEdit("Source Mdict", 134, 130, 260, 45, BitOR($ES_MULTILINE, $ES_READONLY))
	$idButton_Pack = GUICtrlCreateButton("Make MDX", 45, 181, 80, 22)
	$idButton_PackDir = GUICtrlCreateButton("Pack All TXT", 140, 181, 80, 22)
	GUICtrlSetTip(-1, "Pack MDX with all source text files")
	$idButton_PackDirNos = GUICtrlCreateButton("Pack All Splits", 228, 181, 80, 22)
	GUICtrlSetTip(-1, "Pack MDX with all source splits (PyGlossary).")
	$idButton_ConvSqlit = GUICtrlCreateButton("Conv TXT Sql3", 315, 181, 84, 22)
	GUICtrlSetTip(-1, "Convert TXT to sqlite3 DB")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$GroupUnPackMDX = GUICtrlCreateGroup("UnPack MDX", 25, 214, 395, 104)
	$idButton_BrowsePack = GUICtrlCreateButton("FileMDX/MDD", 45, 230, 80, 22)
	$Pack = GUICtrlCreateEdit("File MDX or MDD", 134, 230, 260, 45, BitOR($ES_MULTILINE, $ES_READONLY))
	$idButton_UnPack = GUICtrlCreateButton("Unpack MDX", 45, 258, 80, 22)
	$idButton_UnpMDX_DBzip = GUICtrlCreateButton("UnpFile DBzip", 136, 286, 84, 22)
	GUICtrlSetTip(-1, "Unpack MDX/MDD to sqlite3 DB with zip compress")
	$idButton_Meta = GUICtrlCreateButton("MetaInfo", 360, 286, 50, 22)
	GUICtrlSetTip(-1, "Meta information of MDX/MDD")
	$idButton_UnpMDX_DB = GUICtrlCreateButton("UnpFile DB", 45, 286, 80, 22)
	GUICtrlSetTip(-1, "Unpack MDX/MDD to sqlite3 DB")
	$idButton_UnpSplit = GUICtrlCreateButton("UnpFile Split", 227, 286, 80, 22)
	GUICtrlSetTip(-1, "Unpack MDX/MDD into 'az/n' parts.")
	$ComboSplit = GUICtrlCreateCombo("0", 312, 286, 40, 25)
	GUICtrlSetData(-1, "az|2|3|4|5|6|7|8|9|10")
	GUICtrlSetTip(-1, "Select , 2-10 parts of split")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$GroupPackMDD = GUICtrlCreateGroup("Pack MDD", 29, 322, 393, 80)
	$idButton_BrowseDir = GUICtrlCreateButton("Folder MDD", 45, 340, 80, 22)
	$UnpMDD = GUICtrlCreateEdit("Dir MDD", 134, 342, 260, 45, BitOR($ES_MULTILINE, $ES_READONLY))
	$idButton_PackMDD = GUICtrlCreateButton("Make MDD", 45, 369, 80, 22)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$GroupUnPackMDD = GUICtrlCreateGroup("UnPack MDD / Convert Sqlite3DB to TXT", 30, 414, 393, 113)
	$idButton_BrowseMDD = GUICtrlCreateButton("Select File", 45, 440, 80, 22)
	$idButton_UnMDD = GUICtrlCreateButton("Unpack MDD", 45, 494, 80, 22)
	$PackMDD = GUICtrlCreateEdit("File MDD or DB", 134, 440, 260, 45, BitOR($ES_MULTILINE, $ES_READONLY))
	$idButton_UnpSqlite3 = GUICtrlCreateButton("Conv Sql3 TXT", 315, 494, 84, 22)
	GUICtrlSetTip(-1, "Convert sqlite3 DB to TXT")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$GroupQuery = GUICtrlCreateGroup("Search in MDX dict", 30, 530, 393, 89)
	$idButton_key = GUICtrlCreateButton("Query key", 45, 556, 80, 22)
	$inp_word = GUICtrlCreateInput("", 134, 556, 260, 21)
	GUICtrlSetTip(-1, "Only used to test whether dictionary packaging is correct.%CRLF%??????????????")
	GUICtrlCreateLabel("Enter <WORD> to request the key. Empty for all key list", 134, 582, 282, 20)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	GUICtrlCreateLabel("MORPHOLOGY ,", 510, 144, 268, 17)
	GUICtrlSetTip(-1, "Section Generate for Mdict , StarDict  Kobo dictfile")

	GUICtrlCreateLabel("MORPHOLOGY , INFLECTIONS ( HOMONYMS )", 510, 144, 268, 17)
	GUICtrlSetTip(-1, "Section Generate for Mdict , StarDict & Kobo dictfile")

	$GroupKobo = GUICtrlCreateGroup("Kobo dict", 480, 168, 285, 97)
	$iButtonInfoFlex = GUICtrlCreateButton("Info addFlex", 678, 182, 74, 25)
	GUICtrlSetTip(-1, "Introduction for Inflection")
	$kobo = GUICtrlCreateEdit("Kobo df", 492, 222, 260, 32, BitOR($ES_MULTILINE, $ES_READONLY))
	GUICtrlSetTip(-1, "Path of Kobo dictfile")
	$iButtonKobo = GUICtrlCreateButton("Kobo", 494, 189, 40, 25)
	GUICtrlSetTip(-1, "Select Kobo dictfile")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$GroupInflex = GUICtrlCreateGroup("Generate Inflection", 440, 282, 325, 242)
	$iButtonPython = GUICtrlCreateButton("Python", 446, 300, 40, 25)
	GUICtrlSetTip(-1, "Select Python.exe installed(Portable)")
	$Pyth = GUICtrlCreateEdit("Python exe", 492, 300, 260, 32, BitOR($ES_MULTILINE, $ES_READONLY))
	GUICtrlSetTip(-1, "Path of Python.exe installed(Portable)")
	$iButton_flexpy = GUICtrlCreateButton("FlexPy", 446, 360, 40, 25)
	GUICtrlSetTip(-1, "Select addflex-main Python scrip")
	$flexpy = GUICtrlCreateEdit("addflex_mdx py -> for Mdict" & @CRLF & "addflex_df py -> for Kobo dict", 492, 361, 260, 32, BitOR($ES_MULTILINE, $ES_READONLY))
	GUICtrlSetTip(-1, "Download it from github.com/BorisNA/addflex")
	$iButtonForm = GUICtrlCreateButton("Forms", 446, 405, 40, 26)
	GUICtrlSetTip(-1, "Select wordforms")
	$WordForm = GUICtrlCreateEdit("Forms txt", 492, 406, 260, 32, BitOR($ES_MULTILINE, $ES_READONLY))
	GUICtrlSetTip(-1, "Download it from github.com/BorisNA/wordforms")
	$iButtonConvFlex = GUICtrlCreateButton("Convert Flex", 682, 442, 70, 25)
	GUICtrlSetTip(-1, "Generate inflection")
	$ComboInflex = GUICtrlCreateCombo("Standalone inflection", 526, 444, 140, 26)
	GUICtrlSetData(-1, "Standalone inflection|Morphological dictionary|Kobo dictionary")
	GUICtrlSetTip(-1, "Select , a target dictionary to generate")
	$iButtonFscript = GUICtrlCreateButton("FScript", 446, 464, 42, 26)
	GUICtrlSetTip(-1, "Select check_wordforms script")
	$iButtonCheck = GUICtrlCreateButton("Check", 446, 494, 42, 22)
	GUICtrlSetTip(-1, "It's recommended to Check Forms before converting")
	$FScript = GUICtrlCreateEdit("wordform script py", 494, 478, 260, 32, BitOR($ES_MULTILINE, $ES_READONLY))
	GUICtrlSetTip(-1, "Download it from github.com/BorisNA/wordforms")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$GroupConca = GUICtrlCreateGroup("Concatenate Morph dict + source Mdict", 440, 530, 325, 92)
	$iButtonMorph = GUICtrlCreateButton("Morphо", 446, 550, 42, 26)
	GUICtrlSetTip(-1, "Select Generated Morphological dictionary")
	$Morph = GUICtrlCreateEdit("Morphological txt", 494, 550, 260, 32, BitOR($ES_MULTILINE, $ES_READONLY))
	GUICtrlSetTip(-1, "Path of generated 'Morphological dictionary'")
	$iButtonConca = GUICtrlCreateButton("Concatenate", 676, 588, 73, 25)
	GUICtrlSetTip(-1, "Concatenate 'Morphological dictionary' with Selected 'Source Mdict'")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	GUICtrlCreateLabel("All files must be UTF-8 encoding, include HTML and TXT", 65, 610, 350, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0x0000FF)

	GUISetState(@SW_SHOW)
	Local $iPIDPack = 0
	Local $iPIDUnPack = 0
	Local $iPIDPackMDD = 0
	Local $iPIDUnMDD = 0
	Local $iPIDMeta = 0
	Local $iPIDversPyth = 0
	Local $iPIDversMdict = 0
	Local $iPIDconv_db = 0
	Local $iPIDUn_db = 0
	Local $iPIDPack_all = 0
	Local $iPIDUnPack_db = 0
	Local $iPIDUnPack_zip = 0
	Local $iPIDUnPackSplit = 0
	Local $iPIDquery = 0
	Local $iPIDConvFlex = 0
	Local $iPIDconcat = 0
	Local $iPIDfscript = 0
	Local $sDesc = 0
	Local $sTit = 0
	Local $sUnp = 0
	Local $sPack = 0
	Local $sUnMDD = 0
	Local $sPackMDD = 0
	Local $sForms = 0
	Local $sMorph = 0
	Local $skob = 0
	Local $kobo_ = 0
	Local $Pack_ = ""
	Local $sExt2 = ""
	Local $sExt3 = ""

	; Display the GUI
	GUISetState(@SW_SHOW, $hGUI1)

	; Initialize a Local RUN script.
	Local $aMsg = 0
	RunWait(@ComSpec & " /c %SystemDrive%&&cd %temp%&&echo %cd%>temp.tmp", "", @SW_HIDE) ; create temp file to save %cd%
	$file = FileOpen(@TempDir & "\temp.tmp", 0)
	$line = FileReadLine($file)
	; Read from INI.
	GUICtrlSetData($Pyth, IniRead($line & "\mdictGui_.ini", "Python", "PythonPath", ""))
	GUICtrlSetData($Mdict, IniRead($line & "\mdictGui_.ini", "Mdict", "MdictPath", ""))
	GUICtrlSetData($flexpy, IniRead($line & "\mdictGui_.ini", "Addflex", "addflexpy", ""))
	GUICtrlSetData($FScript, IniRead($line & "\mdictGui_.ini", "FScript", "FScriptpath", ""))

	;-------------Label--addflex script
	If StringInStr(GUICtrlRead($flexpy), "addflex_mdx.py") > 0 Then
		GUICtrlCreateLabel("           Selected 'addflex_mdx py' -> Mdict", 500, 344, 240, 17)
		GUICtrlSetBkColor(-1, 0xFFFFFF)
		GUICtrlSetData($ComboInflex, "Standalone inflection")
	ElseIf StringInStr(GUICtrlRead($flexpy), "addflex_df.py") > 0 Then
		GUICtrlCreateLabel("           Selected 'addflex_df py' -> Kobo df", 500, 344, 240, 17)
		GUICtrlSetBkColor(-1, 0xFFFFFF)
		GUICtrlSetData($ComboInflex, "Kobo dictionary")
	Else
		GUICtrlCreateLabel("addflex_mdx py -> Mdict ; addflex_df py -> Kobo df", 500, 344, 240, 17)
	EndIf
	;------------------------------
	; Check file path for spaces.
	If StringInStr($line, " ") > 0 Then MsgBox(0, "", "There is a space in the 'мdict' path and it may not work properly.")
	;------------------------------

	; Display a message of whether the file Mdict path exists
	If FileOpen(GUICtrlRead($Mdict)) = -1 Then
		If MsgBox(262209, "Check Mdict-utils", "'mdict.exe' doesn't exist. Mdict section won't work." & @CRLF & @CRLF & _
				"Pls visit, " & "github/liuyug/mdict-utils" & @CRLF & _
				"to download last 'mdict-windows'.") = 1 Then ShellExecute("https://github.com/liuyug/mdict-utils/releases")
		GUICtrlCreateLabel("'mdict-utils' does not exist. Mdict section won't work >", 108, 160, 309, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetBkColor(-1, 0xFFFF00)
		GUICtrlCreateLabel(" B"& @CRLF &"  r"& @CRLF &"  o"& @CRLF &"  w"& @CRLF &"  s"& @CRLF &"  e", 418, 94, 18, 96)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetBkColor(-1, 0xFFFF00)
	Else
	EndIf
	FileClose(GUICtrlRead($Mdict))

	Local $msg = 0
	While $msg <> $GUI_EVENT_CLOSE
		$msg = GUIGetMsg()

		; Select File Descr----------------------------1
		Select
			Case $msg = $idButton_Descr
				$sMessageDescr = "Please select a description file."
				$Descr1 = FileOpenDialog($sMessageDescr, @DesktopDir & "\", "Description File (*.*)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					$Descr1 = StringReplace($Descr1, "|", @CRLF)
					; Check file is encoding of UTF
					Local $iEncoding = FileGetEncoding($Descr1) ; Retrieve the file encoding of the current script.
					If @error Then
						MsgBox(8192, "", "Error: Could not obtain the file encoding.")
					ElseIf Not ($iEncoding = 256) + ($iEncoding = 128) Then
						If MsgBox(1, "File Description", "Selected Description is not UTF 8 :" & @CRLF & $Descr1 & @CRLF _
								 & @CRLF & "Do you want to edit (save in UTF-8) it in 'Notepad' ?") = 1 Then
							Run("notepad.exe " & $Descr1, @WindowsDir, @SW_SHOWNORMAL)
						EndIf
					Else
						If FileGetSize($Descr1) > 2048 Then
							If MsgBox(257, "File Description", "Selected file : " & $Descr1 & @CRLF & @CRLF _
									 & "is too large for 'Description', recommended size <2 KB" & @CRLF _
									 & "OK to edit it in 'Notepad' or continue with selected ?") = 1 Then
								Run("notepad.exe " & $Descr1, @WindowsDir, @SW_SHOWNORMAL)
							Else
								$sDesc = 1
								GUICtrlSetData($Descr, $Descr1)
								GUICtrlSetState($ButtonDview, 16)
								GUICtrlSetState($ButtonDclean, 16)
							EndIf
						Else
							$sDesc = 1
							GUICtrlSetData($Descr, $Descr1)
							GUICtrlSetState($ButtonDview, 16)
							GUICtrlSetState($ButtonDclean, 16)
						EndIf
					EndIf
					; Check file path for spaces.
					If StringInStr($Descr1, " ") > 0 Then MsgBox(0, "", "There is a space in the 'file' path and it may not work properly.")
					;----------------------
				EndIf
		EndSelect

		; Select Open Mdict source MTXT-----------------2
		Select
			Case $msg = $idButton_BrowseUnp
				$sMessageUnp = "Please select your Mdict source file."
				$Unp1 = FileOpenDialog($sMessageUnp, @DesktopDir & "\", "Mdict source (*.txt;*.mtxt)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					$Unp1 = StringReplace($Unp1, "|", @CRLF)
					$Un_ = _WinAPI_PathRemoveExtension($Unp1)
					$Un_ = _WinAPI_PathRemoveExtension($Un_)
					$sUnp = 1
					GUICtrlSetData($Unp, $Unp1)
					Local $UnpDir = StringRegExpReplace($Unp1, "\\[^\\]+$", "")
					; Check file path for spaces.
					If StringInStr($Unp1, " ") > 0 Then MsgBox(0, "", "There is a space in the 'file' path and it may not work properly.")
					;----------------------
				EndIf
		EndSelect

		; Select Open MDX/MDD-------------------------------3
		Select
			Case $msg = $idButton_BrowsePack
				$sMessagePack = "Please select an MDX/MDD file."
				$Pack1 = FileOpenDialog($sMessagePack, @DesktopDir & "\", "Mdict file (*.mdx;*.mdd)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					$Pack1 = StringReplace($Pack1, "|", @CRLF)
					$sPack = 1
					GUICtrlSetData($Pack, $Pack1)
					$sExt3 = StringRegExpReplace($Pack1, "^.*\.", "")
					; Check file path for spaces.
					If StringInStr($Pack1, " ") > 0 Then MsgBox(0, "", "There is a space in the 'file' path and it may not work properly.")
					;----------------------
				EndIf
		EndSelect

		; Select Button_Pack MDX----------------------------4
		Select
			Case $msg = $idButton_Pack
				If $sUnp = 0 Then
					MsgBox(8192, "", "You are not chosen Mdict source")
				Else
					If $sTit = 0 Then
						If $sDesc = 0 Then
							If MsgBox(1, "Your choice", "You choose Mdict source:" & @CRLF & GUICtrlRead($Unp) & @CRLF & _
									"will be pack without Description as:" & @CRLF & $Un_ & ".mdx") = 1 Then
								$iPIDPack = Run(GUICtrlRead($Mdict) & " -a " & GUICtrlRead($Unp) & " " & $Un_ & ".mdx", "", @SW_SHOWNORMAL)
								$sPack = 1
								GUICtrlSetData($Pack, $Un_ & ".mdx")
							EndIf
						Else
							If MsgBox(1, "Your choice", "You choose Mdict source:" & @CRLF _
									 & GUICtrlRead($Unp) & @CRLF & "will be pack as:" & @CRLF & $Un_ & ".mdx") = 1 Then
								$iPIDPack = Run(GUICtrlRead($Mdict) & " --description " & GUICtrlRead($Descr) & " -a " & GUICtrlRead($Unp) & " " & $Un_ & ".mdx", "", @SW_SHOWNORMAL)
								$sPack = 1
								GUICtrlSetData($Pack, $Un_ & ".mdx")
							EndIf
						EndIf
					Else
						If $sDesc = 0 Then
							If MsgBox(1, "Your choice", "You choose Mdict source:" & @CRLF & GUICtrlRead($Unp) & @CRLF & _
									"with Title will be pack without Description as:" & @CRLF & $Un_ & ".mdx") = 1 Then
								$iPIDPack = Run(GUICtrlRead($Mdict) & " --title " & GUICtrlRead($Title) & " -a " & GUICtrlRead($Unp) & " " & $Un_ & ".mdx", "", @SW_SHOWNORMAL)
								$sPack = 1
								GUICtrlSetData($Pack, $Un_ & ".mdx")
							EndIf
						Else
							If MsgBox(1, "Your choice", "You choose Mdict source:" & @CRLF _
									 & GUICtrlRead($Unp) & @CRLF & "with Title will be pack as:" & @CRLF & $Un_ & ".mdx") = 1 Then
								$iPIDPack = Run(GUICtrlRead($Mdict) & " --title " & GUICtrlRead($Title) & " --description " & GUICtrlRead($Descr) & " -a " & GUICtrlRead($Unp) & " " & $Un_ & ".mdx", "", @SW_SHOWNORMAL)
								$sPack = 1
								GUICtrlSetData($Pack, $Un_ & ".mdx")
							EndIf
						EndIf
					EndIf
				EndIf
		EndSelect

		; Select Button_UnPack MDX --------------------------5
		Select
			Case $msg = $idButton_UnPack
				If $sPack = 0 Or $sExt3 = "mdd" Then
					MsgBox(8192, "", "You are not chosen MDX file")
				Else
					If MsgBox(1, "Your choice", "You choose MDX file:" & @CRLF & "" & GUICtrlRead($Pack) & "" & @CRLF & "will be unpack in dir: MDX") = 1 Then
						$iPIDUnPack = Run(GUICtrlRead($Mdict) & " -x " & GUICtrlRead($Pack) & " -d ./mdx", "", @SW_SHOWNORMAL)
					EndIf
				EndIf
		EndSelect

		; Select Button_Metainfo-----------------------------6
		Select
			Case $msg = $idButton_Meta
				If $sPack = 0 Then
					MsgBox(8192, "", "You are not chosen MDX/MDD file")
				Else
					$iPIDMeta = Run(@ComSpec & " /k " & GUICtrlRead($Mdict) & " -m " & GUICtrlRead($Pack) & "", "", @SW_SHOWNORMAL)
				EndIf
		EndSelect

		; Select Button_Mdict_version------------------------7
		Select
			Case $msg = $idButton_vers
				If GUICtrlRead($Pyth) = "" Then
					$iPIDversMdict = Run(@ComSpec & " /k " & GUICtrlRead($Mdict) & " --version", "", @SW_HIDE, $STDOUT_CHILD + $STDERR_CHILD)
				Else
					$iPIDversMdict = Run(@ComSpec & " /k " & GUICtrlRead($Mdict) & " --version", "", @SW_HIDE, $STDOUT_CHILD + $STDERR_CHILD)
					$iPIDversPyth = Run(@ComSpec & " /k " & GUICtrlRead($Pyth) & " --version", "", @SW_HIDE, $STDOUT_CHILD + $STDERR_CHILD)
					Run(@ComSpec & " /k " & GUICtrlRead($Pyth) & " -m pip list", "", @SW_SHOWNORMAL)
				EndIf
				Global $ResponsePyth, $ResponseMdict
				While 1
					If GUICtrlRead($Mdict) = "" Then
						$ResponsePyth &= StdoutRead($iPIDversPyth)
						;$ResponseMdict &= StdoutRead($iPIDversMdict)
					Else
						$ResponsePyth &= StdoutRead($iPIDversPyth)
						$ResponseMdict &= StdoutRead($iPIDversMdict)
					EndIf
					If @error Then ExitLoop
				WEnd
				$ResponseMdict = StringReplace($ResponseMdict, @WorkingDir & ">", "")
				$ResponsePyth = StringReplace($ResponsePyth, @WorkingDir & ">", "")
				MsgBox(0, "Test Mdict Version", "Mdict ===> " & $ResponseMdict & @CRLF & "Python ==> " & $ResponsePyth)
				Global $ResponsePyth = "", $ResponseMdict = ""
		EndSelect

		; Select  Folder MDD----------------------------------8
		Select
			Case $msg = $idButton_BrowseDir
				$sMessageUnpMDD = "Please select your Mdd folder."
				$UnpMDD1 = FileSelectFolder($sMessageUnpMDD, "")
				If @error Then
				Else
					$sUnMDD = 1
					GUICtrlSetData($UnpMDD, $UnpMDD1)
					; Check file path for spaces.
					If StringInStr($UnpMDD1, " ") > 0 Then MsgBox(0, "", "There is a space in the 'folder' path and it may not work properly.")
					;----------------------
				EndIf
		EndSelect

		; Select Open MDD file----------------------------------9
		Select
			Case $msg = $idButton_BrowseMDD
				$sMessagePackMDD = "Please select an MDD/DB file."
				$PackMDD1 = FileOpenDialog($sMessagePackMDD, @DesktopDir & "\", "Open file (*.mdd;*.db)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					$PackMDD1 = StringReplace($PackMDD1, "|", @CRLF)
					$sPackMDD = 1
					GUICtrlSetData($PackMDD, $PackMDD1)
					$sExt2 = StringRegExpReplace($PackMDD1, "^.*\.", "")
					; Check file path for spaces.
					If StringInStr($PackMDD1, " ") > 0 Then MsgBox(0, "", "There is a space in the 'file' path and it may not work properly.")
					;----------------------
				EndIf
		EndSelect

		; Select Button_Pack MDD--------------------------------10
		Select
			Case $msg = $idButton_PackMDD
				If $sUnMDD = 0 Then
					MsgBox(8192, "", "You are not chosen MDD source")
				Else
					If $sTit = 0 Then
						If $sDesc = 0 Then
							If MsgBox(1, "Your choice", "You choose MDD source:" & @CRLF & "" & GUICtrlRead($UnpMDD) & "" & @CRLF _
									 & "will be pack without Description as:" & @CRLF & GUICtrlRead($UnpMDD) & ".mdd") = 1 Then
								$iPIDPackMDD = Run(GUICtrlRead($Mdict) & " -a " & GUICtrlRead($UnpMDD) & " " & GUICtrlRead($UnpMDD) & ".mdd", "", @SW_SHOWNORMAL)
							EndIf
						Else
							If MsgBox(1, "Your choice", "You choose Mdict source:" & @CRLF & "" & GUICtrlRead($UnpMDD) & "" & @CRLF & "will be pack as:" & @CRLF & GUICtrlRead($UnpMDD) & ".mdd") = 1 Then
								$iPIDPackMDD = Run(GUICtrlRead($Mdict) & " --description " & GUICtrlRead($Descr) & " -a " & GUICtrlRead($UnpMDD) & " " & GUICtrlRead($UnpMDD) & ".mdd", "", @SW_SHOWNORMAL)
							EndIf
						EndIf
					Else
						If $sDesc = 0 Then
							If MsgBox(1, "Your choice", "You choose MDD source:" & @CRLF & "" & GUICtrlRead($UnpMDD) & "" & @CRLF _
									 & "with Title will be pack without Description as:" & @CRLF & GUICtrlRead($UnpMDD) & ".mdd") = 1 Then
								$iPIDPackMDD = Run(GUICtrlRead($Mdict) & " --title " & GUICtrlRead($Title) & " -a " & GUICtrlRead($UnpMDD) & " " & GUICtrlRead($UnpMDD) & ".mdd", "", @SW_SHOWNORMAL)
							EndIf
						Else
							If MsgBox(1, "Your choice", "You choose Mdict source:" & @CRLF & "" & GUICtrlRead($UnpMDD) & "" & @CRLF & "with Title will be pack as:" & @CRLF & GUICtrlRead($UnpMDD) & ".mdd") = 1 Then
								$iPIDPackMDD = Run(GUICtrlRead($Mdict) & " --title " & GUICtrlRead($Title) & " --description " & GUICtrlRead($Descr) & " -a " & GUICtrlRead($UnpMDD) & " " & GUICtrlRead($UnpMDD) & ".mdd", "", @SW_SHOWNORMAL)
							EndIf
						EndIf
					EndIf
				EndIf
		EndSelect

		; Select Button_UnPack MDD-------------------------------11
		Select
			Case $msg = $idButton_UnMDD
				If $sPackMDD = 0 Or $sExt2 = "db" Then
					MsgBox(8192, "", "You are not chosen MDD file")
				Else
					If MsgBox(1, "Your choice", "You choose MDD file:" & @CRLF & "" & GUICtrlRead($PackMDD) & "" & @CRLF & "will be unpack in dir: MDD") = 1 Then
						$iPIDUnMDD = Run(GUICtrlRead($Mdict) & " -x " & GUICtrlRead($PackMDD) & " -d ./mdd", "", @SW_SHOWNORMAL)
					EndIf
				EndIf
		EndSelect

		; Select Button_UnPackMDD to Sqlite3-db------------------12
		Select
			Case $msg = $idButton_UnpSqlite3
				If $sPackMDD = 0 Or $sExt2 = "mdd" Then
					MsgBox(8192, "", "You are not chosen db file")
				Else
					If MsgBox(1, "Your choice", "You choose Sqlite3 db file:" & @CRLF _
							 & "" & GUICtrlRead($PackMDD) & "" & @CRLF & "will be unpack as:" & GUICtrlRead($PackMDD) & ".txt") = 1 Then
						$iPIDUn_db = Run(GUICtrlRead($Mdict) & " --db-txt " & GUICtrlRead($PackMDD) & "", "", @SW_SHOWNORMAL)
					EndIf
				EndIf
		EndSelect

		; Select Button_Conv TXT Sql3----------------------------13
		Select
			Case $msg = $idButton_ConvSqlit
				If $sUnp = 0 Then
					MsgBox(8192, "", "You are not chosen Mdict source")
				Else
					If MsgBox(1, "Your choice", "You choose Mdict source:" & @CRLF & "" & GUICtrlRead($Unp) & "" & @CRLF & "will be convert as:" & GUICtrlRead($Unp) & ".db") = 1 Then
						$iPIDconv_db = Run(GUICtrlRead($Mdict) & " --txt-db " & GUICtrlRead($Unp) & "", "", @SW_SHOWNORMAL)
					EndIf
				EndIf
		EndSelect

		; Select Button_Pack All TXT----------------------------14
		Select
			Case $msg = $idButton_PackDir
				If $sUnp = 0 Then
					MsgBox(8192, "", "You are not chosen at last one Mdict source")
				Else
					If $sTit = 0 Then
						If $sDesc = 0 Then
							If MsgBox(1, "Your choice", "In selected Mdict Folder :" & @CRLF & "" & $UnpDir & "" & @CRLF _
									 & "all TXT will be pack without Description as :" & @CRLF & $UnpDir & "\Alldict.mdx") = 1 Then
								$iPIDPack_all = Run(GUICtrlRead($Mdict) & " -a " & $UnpDir & " " & $UnpDir & "\Alldict.mdx", "", @SW_SHOWNORMAL)
							EndIf
						Else
							If MsgBox(1, "Your choice", "In selected Mdict Folder :" & @CRLF & "" & $UnpDir & "" & @CRLF _
									 & "all TXT will be pack as :" & @CRLF & $UnpDir & "\Alldict_descr.mdx") = 1 Then
								$iPIDPack_all = Run(GUICtrlRead($Mdict) & " --description " & GUICtrlRead($Descr) & " -a " & $UnpDir & " " & $UnpDir & "\Alldict_descr.mdx", "", @SW_SHOWNORMAL)
							EndIf
						EndIf
					Else
						If $sDesc = 0 Then
							If MsgBox(1, "Your choice", "In selected Mdict Folder :" & @CRLF & "" & $UnpDir & "" & @CRLF _
									 & "with Title all TXT will be pack without Description as :" & @CRLF & $UnpDir & "\Alldict_title.mdx") = 1 Then
								$iPIDPack_all = Run(GUICtrlRead($Mdict) & " --title " & GUICtrlRead($Title) & " -a " & $UnpDir & " " & $UnpDir & "\Alldict_title.mdx", "", @SW_SHOWNORMAL)
							EndIf
						Else
							If MsgBox(1, "Your choice", "In selected Mdict Folder :" & @CRLF & "" & $UnpDir & "" & @CRLF _
									 & "with Title all TXT will be pack as :" & @CRLF & $UnpDir & "\Alldict_title_descr.mdx") = 1 Then
								$iPIDPack_all = Run(GUICtrlRead($Mdict) & " --title " & GUICtrlRead($Title) & " --description " & GUICtrlRead($Descr) & " -a " & $UnpDir & " " & $UnpDir & "\Alldict_title_descr.mdx", "", @SW_SHOWNORMAL)
							EndIf
						EndIf
					EndIf
				EndIf
		EndSelect

		; Select Button_Pack All splits----------------------------15
		Select
			Case $msg = $idButton_PackDirNos
				If $sUnp = 0 Then
					MsgBox(8192, "", "You are not chosen at last one Mdict source")
				Else
					;=======================================
					Local $FileDir = StringRegExpReplace($Un_, "\\[^\\]*$", "")
					Local $FileName = StringRegExpReplace($Un_, "^.*\\", "")
					Global $sPathToFiles = $FileDir & "\"
					If MsgBox(1, "Your choice", "Wont to rename all '" & $FileName & "' source splits in dir:" & @CRLF & "" & $sPathToFiles & "" & @CRLF _
							 & "with numbers, for the action 'Pack All Splits'" & @CRLF & @CRLF & "Note. The Name & Description files should not be in the dir:" & @CRLF & "" & $sPathToFiles & "") = 1 Then
						Global $newFileName = 0, $aFilesToRename = ""
						$aFilesToRename = _FileListToArray($sPathToFiles, "*.??", 1)
						For $i = 1 To $aFilesToRename[0]
							$newFileName += 1
							FileMove($sPathToFiles & $aFilesToRename[$i], $sPathToFiles & $FileName & "." & String($newFileName) & ".txt", 0)
						Next
						;=======================================
						If $sTit = 0 Then
							If $sDesc = 0 Then
								If MsgBox(1, "Your choice", "In selected Mdict Folder :" & @CRLF & "" & $UnpDir & "" & @CRLF _
										 & "all TXT will be pack without Description as :" & @CRLF & $UnpDir & "\Allsplit.mdx") = 1 Then
									$iPIDPack_all = Run(GUICtrlRead($Mdict) & " -a " & $UnpDir & " " & $UnpDir & "\Allsplit.mdx", "", @SW_SHOWNORMAL)
								EndIf
							Else
								If MsgBox(1, "Your choice", "In selected Mdict Folder :" & @CRLF & "" & $UnpDir & "" & @CRLF _
										 & "all TXT will be pack as :" & @CRLF & $UnpDir & "\Allsplit_descr.mdx") = 1 Then
									$iPIDPack_all = Run(GUICtrlRead($Mdict) & " --description " & GUICtrlRead($Descr) & " -a " & $UnpDir & " " & $UnpDir & "\Allsplit_descr.mdx", "", @SW_SHOWNORMAL)
								EndIf
							EndIf
						Else
							If $sDesc = 0 Then
								If MsgBox(1, "Your choice", "In selected Mdict Folder :" & @CRLF & "" & $UnpDir & "" & @CRLF _
										 & "with Title all TXT will be pack without Description as :" & @CRLF & $UnpDir & "\Allsplit_title.mdx") = 1 Then
									$iPIDPack_all = Run(GUICtrlRead($Mdict) & " --title " & GUICtrlRead($Title) & " -a " & $UnpDir & " " & $UnpDir & "\Allsplit_title.mdx", "", @SW_SHOWNORMAL)
								EndIf
							Else
								If MsgBox(1, "Your choice", "In selected Mdict Folder :" & @CRLF & "" & $UnpDir & "" & @CRLF _
										 & "with Title all TXT will be pack as :" & @CRLF & $UnpDir & "\Allsplit_title_descr.mdx") = 1 Then
									$iPIDPack_all = Run(GUICtrlRead($Mdict) & " --title " & GUICtrlRead($Title) & " --description " & GUICtrlRead($Descr) & " -a " & $UnpDir & " " & $UnpDir & "\Allsplit_title_descr.mdx", "", @SW_SHOWNORMAL)
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf

		EndSelect

		; Select Button_UnPackMDX/MDD to DB-------------------------16
		Select
			Case $msg = $idButton_UnpMDX_DB
				If $sPack = 0 Then
					MsgBox(8192, "", "You are not chosen MDX/MDD file")
				Else
					$Pack_ = _WinAPI_PathRemoveExtension($Pack1)
					$Pack_ = _WinAPI_PathRemoveExtension($Pack_)
					If $sExt3 = "mdx" Then
						If MsgBox(1, "Your choice", "You choosed MDX file:" & @CRLF & "" & GUICtrlRead($Pack) & "" & @CRLF & @CRLF & "is packing as :" & @CRLF & GUICtrlRead($Pack) & ".mdx.db") = 1 Then
							FileCopy(GUICtrlRead($Pack), $Pack_ & ".mdx.mdx", $FC_OVERWRITE)
							$iPIDUnPack_zip = Run(GUICtrlRead($Mdict) & " -x " & $Pack_ & ".mdx.mdx --exdb", "", @SW_SHOWNORMAL)
							MsgBox(8192, "Waiting for the end of Mdict", "!Pls,wait while MDX unpacks into a db!")
							FileDelete($Pack_ & ".mdx.mdx")
						EndIf
					Else
						If MsgBox(1, "Your choice", "You choosed MDX file:" & @CRLF & "" & GUICtrlRead($Pack) & "" & @CRLF _
								 & @CRLF & "is packing as :" & @CRLF & $Pack_ & ".mdd.db") = 1 Then
							FileCopy(GUICtrlRead($Pack), $Pack_ & ".mdd.mdd", $FC_OVERWRITE)
							$iPIDUnPack_zip = Run(GUICtrlRead($Mdict) & " -x " & $Pack_ & ".mdd.mdd --exdb", "", @SW_SHOWNORMAL)
							MsgBox(8192, "Waiting for the end of Mdict", "!Pls,wait while MDD unpacks into a db!")
							FileDelete($Pack_ & ".mdd.mdd")
						EndIf
					EndIf
				EndIf
		EndSelect

		; Select Button_UnPackMDX/MDD to DBzip-----------------------17
		Select
			Case $msg = $idButton_UnpMDX_DBzip
				If $sPack = 0 Then
					MsgBox(4096, "", "You are not chosen MDX/MDD file")
				Else
					$Pack_ = _WinAPI_PathRemoveExtension($Pack1)
					$Pack_ = _WinAPI_PathRemoveExtension($Pack_)
					If $sExt3 = "mdx" Then
						If MsgBox(1, "Your choice", "You choosed MDX file:" & @CRLF & "" & GUICtrlRead($Pack) & "" & @CRLF _
								 & @CRLF & "is packing as compressed:" & @CRLF & $Pack_ & ".mdx_zip.db") = 1 Then
							FileCopy(GUICtrlRead($Pack), $Pack_ & ".mdx_zip.mdx", $FC_OVERWRITE)
							$iPIDUnPack_zip = Run(GUICtrlRead($Mdict) & " -x " & $Pack_ & ".mdx_zip.mdx --exdb-zip", "", @SW_SHOWNORMAL)
							MsgBox(8192, "Waiting for the end of Mdict", "!Pls,wait while MDX unpacks into a db zip!")
							FileDelete($Pack_ & ".mdx_zip.mdx")
						EndIf
					Else
						If MsgBox(1, "Your choice", "You choosed MDX file:" & @CRLF & "" & GUICtrlRead($Pack) & "" & @CRLF _
								 & @CRLF & "is packing as compressed:" & @CRLF & $Pack_ & ".mdd_zip.db") = 1 Then
							FileCopy(GUICtrlRead($Pack), $Pack_ & ".mdd_zip.mdd", $FC_OVERWRITE)
							$iPIDUnPack_zip = Run(GUICtrlRead($Mdict) & " -x " & $Pack_ & ".mdd_zip.mdd --exdb-zip", "", @SW_SHOWNORMAL)
							MsgBox(8192, "Waiting for the end of Mdict", "!Pls,wait while MDD unpacks into a db zip!")
							FileDelete($Pack_ & ".mdd_zip.mdd")
						EndIf
					EndIf
				EndIf
		EndSelect

		; Select Choise Combo Split Parts----------------------------18
		Select
			Case $msg = $ComboSplit
				$sComboRead = GUICtrlRead($ComboSplit)
		EndSelect

		; Select Button_UnPack MDX/MDD to Splits---------------------19
		Select
			Case $msg = $idButton_UnpSplit
				If $sPack = 0 Then
					MsgBox(8192, "", "You are not chosen MDX/MDD file")
				Else
					$sComboRead = GUICtrlRead($ComboSplit)
					If $sComboRead = "0" Then
						MsgBox(8192, "", "You are not chosen Splits: " & $sComboRead)
					Else
						If $sExt3 = "mdx" Then
							If MsgBox(1, "Your choice", "You choose MDX file:" & @CRLF & "" & GUICtrlRead($Pack) & "" & @CRLF _
									 & "will be unpacked into " & $sComboRead & " parts in dir : " & $sExt3) = 1 Then
								If $sComboRead = "az" Then
									$iPIDUnPackSplit = Run(GUICtrlRead($Mdict) & " -x " & GUICtrlRead($Pack) & " -d ./mdx --split-" & $sComboRead & "", "", @SW_SHOWNORMAL)
								Else
									$iPIDUnPackSplit = Run(GUICtrlRead($Mdict) & " -x " & GUICtrlRead($Pack) & " -d ./mdx --split-n " & $sComboRead & "", "", @SW_SHOWNORMAL)
								EndIf
							EndIf
						ElseIf $sExt3 = "mdd" Then
							If MsgBox(1, "Your choice", "You choose MDD file:" & @CRLF & "" & GUICtrlRead($Pack) & "" & @CRLF _
									 & "will be unpacked into " & $sComboRead & " parts in dir : " & $sExt3) = 1 Then
								If $sComboRead = "az" Then
									$iPIDUnPackSplit = Run(GUICtrlRead($Mdict) & " -x " & GUICtrlRead($Pack) & " -d ./mdd --split-" & $sComboRead & "", "", @SW_SHOWNORMAL)
								Else
									$iPIDUnPackSplit = Run(GUICtrlRead($Mdict) & " -x " & GUICtrlRead($Pack) & " -d ./mdd --split-n " & $sComboRead & "", "", @SW_SHOWNORMAL)
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
		EndSelect

		; Select Button GuiUpdate------------------------------------20
		Select
			Case $msg = $idButton_upd
				If MsgBox(1, "Check the latest mdictGui releases", "Want to check the GitHub repository" & @CRLF & _
						"for the latest mdictGui releases?") = 1 Then ShellExecute("https://github.com/jekovcar/mdict-utils-Gui/releases")
		EndSelect

		; Select Button mdict Pypi-------------------------------21
		Select
			Case $msg = $idButton_pypi
				If MsgBox(1, "Check the latest mdict-utils", "Want to check Project mdict-utils" & @CRLF & _
						"on Pypi.Org for the latest releases?") = 1 Then ShellExecute("https://pypi.org/project/mdict-utils/")
		EndSelect

		; Select button Query key--------------------------------22
		Select
			Case $msg = $idButton_key
				$inp = GUICtrlRead($inp_word)
				If $sPack = 0 Or $sExt3 = "mdd" Then
					MsgBox(8192, "", "You are not chosen MDX file")
				Else
					If $inp = "" Then
						If MsgBox(1, "Your choice", "Typed word is EMPTY." & @CRLF & @CRLF & "Mdict will All key list ?") = 1 Then
							$iPIDquery = Run(@ComSpec & " /k " & GUICtrlRead($Mdict) & " -k " & GUICtrlRead($Pack) & "", "", @SW_SHOWNORMAL)
						EndIf
					Else
						If MsgBox(1, "Your choice", "Query word <" & $inp & "> in :" & @CRLF & @CRLF & GUICtrlRead($Pack) & " ?") = 1 Then
							$iPIDquery = Run(@ComSpec & " /k " & GUICtrlRead($Mdict) & " -q " & $inp & " " & GUICtrlRead($Pack) & "", "", @SW_SHOWNORMAL)
						EndIf
					EndIf
				EndIf
		EndSelect

		; Select path of  PYTHON ------------------------------23
		Select
			Case $msg = $iButtonPython
				$sMessagePack = "Please select path of PYTHON."
				$Pyth1 = FileOpenDialog($sMessagePack, @DesktopDir & "\", "python (python.exe)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					; Check file path for spaces.
					If StringInStr($Pyth1, " ") > 0 Then
						MsgBox(0, "", "There is a space in the 'file' path, pls to select correct.")
					Else
						$Pyth1 = StringReplace($Pyth1, "|", @CRLF)
						GUICtrlSetData($Pyth, $Pyth1)
						IniWrite($line & "\mdictGui_.ini", "Python", "PythonPath", GUICtrlRead($Pyth))
					EndIf
				EndIf
		EndSelect

		; Select script of  addflex py---------------------------24
		Select
			Case $msg = $iButton_flexpy
				$sMessagePack = "Please select PY script addflex_mdx."
				$flexpy1 = FileOpenDialog($sMessagePack, @DesktopDir & "\", "addflex (addflex_df.py;addflex_mdx.py)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					$flexpy1 = StringReplace($flexpy1, "|", @CRLF)
					GUICtrlSetData($flexpy, $flexpy1)
					IniWrite($line & "\mdictGui_.ini", "Addflex", "addflexpy", GUICtrlRead($flexpy))
					;-------------Label--addflex script
					If StringInStr(GUICtrlRead($flexpy), "addflex_mdx.py") > 0 Then
						GUICtrlCreateLabel("           Selected 'addflex_mdx py' -> Mdict", 500, 344, 240, 17)
						GUICtrlSetBkColor(-1, 0xFFFFFF)
						GUICtrlSetData($ComboInflex, "Standalone inflection")
					ElseIf StringInStr(GUICtrlRead($flexpy), "addflex_df.py") > 0 Then
						GUICtrlCreateLabel("           Selected 'addflex_df py' -> Kobo df", 500, 344, 240, 17)
						GUICtrlSetBkColor(-1, 0xFFFFFF)
						GUICtrlSetData($ComboInflex, "Kobo dictionary")
					Else
					EndIf
					; Check file path for spaces.
					If StringInStr($flexpy1, " ") > 0 Then MsgBox(0, "", "There is a space in the 'file' path and it may not work properly.")
					;----------------------
				EndIf
		EndSelect

		; Select file of  WordForm-----------------------------25
		Select
			Case $msg = $iButtonForm
				$sMessagePack = "Please select file of WordForm."
				$WordForm1 = FileOpenDialog($sMessagePack, @DesktopDir & "\", "Forms-Lng (*.txt)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					If StringInStr($WordForm1, "infl") Or StringInStr($WordForm1, "morph") > 0 Then
						MsgBox(0, "", "Selected WordForm may is not source, pls to select correct.")
					ElseIf StringInStr($WordForm1, "forms-") > 0 Then
						$WordForm1 = StringReplace($WordForm1, "|", @CRLF)
						$Form = _WinAPI_PathRemoveExtension($WordForm1)
						$sForms = 1
						GUICtrlSetData($WordForm, $WordForm1)
						; Check file path for spaces.
						If StringInStr($WordForm1, " ") > 0 Then MsgBox(0, "", "There is a space in the 'file' path and it may not work properly.")
						;----------------------
					Else
						MsgBox(0, "", "Selected WordForm not contain 'forms-', pls to select again.")
					EndIf
				EndIf
		EndSelect

		; Select Choise Combo Inflex----------------------------26
		Select
			Case $msg = $ComboInflex
				$sComboReadInflex = GUICtrlRead($ComboInflex)
		EndSelect

		; Select Button_ConvertFlex ----------------------------27
		Select
			Case $msg = $iButtonConvFlex
				If GUICtrlRead($Pyth) = "" Or GUICtrlRead($flexpy) = "" Or $sForms = 0 Then
					MsgBox(8192, "", "You are not chosen all of need file paths")
				Else
					$sComboReadInflex = GUICtrlRead($ComboInflex)
					If $sComboReadInflex = "Standalone inflection" Then
						If StringInStr(GUICtrlRead($flexpy), "addflex_df.py") > 0 Then MsgBox(0, "", "Selected Scrip for Kobo dict NOT convert properly.")
						If MsgBox(1, "Standalone inflection", "You choose WordForm file:" & @CRLF & "" & GUICtrlRead($WordForm) & "" & @CRLF & "will be convert to: " & $Form & "_infl.txt") = 1 Then
							$iPIDConvFlex = Run(@ComSpec & " /k " & GUICtrlRead($Pyth) & " " & GUICtrlRead($flexpy) & " -t " & GUICtrlRead($WordForm) & " -o " & $Form & "_infl.txt", "", @SW_SHOWNORMAL)
							$Un_ = $Form & "_infl"
							$sUnp = 1
							GUICtrlSetData($Unp, $Form & "_infl.txt")
						EndIf
					ElseIf $sComboReadInflex = "Morphological dictionary" Then
						If StringInStr(GUICtrlRead($flexpy), "addflex_df.py") > 0 Then MsgBox(0, "", "Selected Scrip for Kobo dict NOT convert properly.")
						If MsgBox(1, "Morphological dictionary", "You choose WordForm file:" & @CRLF & "" & GUICtrlRead($WordForm) & "" & @CRLF & "will be convert to: " & $Form & "_morph.txt") = 1 Then
							$iPIDConvFlex = Run(@ComSpec & " /k " & GUICtrlRead($Pyth) & " " & GUICtrlRead($flexpy) & " -l -t " & GUICtrlRead($WordForm) & " -o " & $Form & "_morph.txt", "", @SW_SHOWNORMAL)
							$Morph_ = $Form & "_morph"
							$sMorph = 1
							GUICtrlSetData($Morph, $Form & "_morph.txt")
						EndIf
					Else
						If $skob = 0 Then
							MsgBox(8192, "", "You are not chosen needed Kobo dictfile path")
						Else
							If StringInStr(GUICtrlRead($flexpy), "addflex_mdx.py") > 0 Then MsgBox(0, "", "Selected Scrip for Mdict NOT convert properly.")
							If MsgBox(1, "Kobo dictionary", "You choose WordForm file:" & @CRLF & "" & GUICtrlRead($WordForm) & "" & @CRLF & "will be convert to: " & $kobo_ & "_out.df") = 1 Then
								$iPIDConvFlex = Run(@ComSpec & " /k " & GUICtrlRead($Pyth) & " " & GUICtrlRead($flexpy) & " -i " & GUICtrlRead($kobo) & " -o " & $kobo_ & "_out.df -t " & GUICtrlRead($WordForm), "", @SW_SHOWNORMAL)
							EndIf
						EndIf
					EndIf
				EndIf
		EndSelect

		; Select file of  Morphological inflection---------------28
		Select
			Case $msg = $iButtonMorph
				$sMessagePack = "Please select Morphological inflection."
				$Morph1 = FileOpenDialog($sMessagePack, @DesktopDir & "\", "_morph (*.txt)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					$Morph1 = StringReplace($Morph1, "|", @CRLF)
					$Morph_ = _WinAPI_PathRemoveExtension($Morph1)
					$sMorph = 1
					GUICtrlSetData($Morph, $Morph1)
					; Check file path for spaces.
					If StringInStr($Morph1, " ") > 0 Then MsgBox(0, "", "There is a space in the 'file' path and it may not work properly.")
					;----------------------
				EndIf
		EndSelect

		; Select Button_Concatenate-----------------------------29
		Select
			Case $msg = $iButtonConca
				If $sMorph = 0 Or $sUnp = 0 Then
					MsgBox(8192, "", "You are not chosen needed file paths")
				Else
					$Um_ = _WinAPI_PathRemoveExtension(GUICtrlRead($Unp))
					$Um_ = _WinAPI_PathRemoveExtension($Um_)
					If MsgBox(1, "Concatenate", "Concatenate 'Morpho dict' with 'source Mdict' to:" & @CRLF & $Um_ & "_morph.concat.txt ?") = 1 Then
						$iPIDconcat = Run(@ComSpec & " /k ""copy " & GUICtrlRead($Unp) & "+" & GUICtrlRead($Morph) & " " & $Um_ & "_morph.concat.txt", "", @SW_SHOWNORMAL)
						$Un_ = $Um_ & "_morph"
						$sUnp = 1
						GUICtrlSetData($Unp, $Um_ & "_morph.concat.txt")
					EndIf
				EndIf
		EndSelect

		; Select Button InfoFlex--------------------------------30
		Select
			Case $msg = $iButtonInfoFlex
				If MsgBox(1, "Help addflex", "Go to Github for info addflex" & @CRLF & _
						"and guide 'How to addflex' ?") = 1 Then ShellExecute("https://github.com/jekovcar/mdict-utils-Gui/blob/main/Use%20mdict-utils-Gui.pdf")
		EndSelect

		; Select path of  Kobo dict -----------------------------31
		Select
			Case $msg = $iButtonKobo
				$sMessagePack = "Please select Kobo dictionary."
				$kobo1 = FileOpenDialog($sMessagePack, @DesktopDir & "\", "Kobo dict (*.df)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					$kobo1 = StringReplace($kobo1, "|", @CRLF)
					$kobo_ = _WinAPI_PathRemoveExtension($kobo1)
					$skob = 1
					GUICtrlSetData($kobo, $kobo1)
					; Check file path for spaces.
					If StringInStr($kobo1, " ") > 0 Then MsgBox(0, "", "There is a space in the 'file' path and it may not work properly.")
					;----------------------
				EndIf
		EndSelect

		; Select path of Mdict.exe-------------------------------32
		Select
			Case $msg = $iButtonMdict
				$Mdict1 = FileOpenDialog("Please select your Mdict.exe.", @DesktopDir & "\", "Mdict  (Mdict.exe)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					; Check file path for spaces.
					If StringInStr($Mdict1, " ") > 0 Then
						MsgBox(0, "", "There is a space in the 'file' path, pls to select correct.")
					Else
						$Mdict1 = StringReplace($Mdict1, "|", @CRLF)
						GUICtrlSetData($Mdict, $Mdict1)
						IniWrite($line & "\mdictGui_.ini", "Mdict", "MdictPath", GUICtrlRead($Mdict))
						MsgBox(0, "", "Pls to restart Gui & Run 'Mdict Test' for effect.")
					EndIf
				EndIf
		EndSelect

		; Select path of  Fscript ------------------------------33
		Select
			Case $msg = $iButtonFscript
				$sMessagePack = "Please select path of wordform script."
				$Fscript1 = FileOpenDialog($sMessagePack, @DesktopDir & "\", "script (check_wordforms.py)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					; Check file path for spaces.
					If StringInStr($Fscript1, " ") > 0 Then
						MsgBox(0, "", "There is a space in the 'file' path, pls to select correct.")
					Else
						$Fscript1 = StringReplace($Fscript1, "|", @CRLF)
						GUICtrlSetData($FScript, $Fscript1)
						IniWrite($line & "\mdictGui_.ini", "FScript", "FScriptpath", GUICtrlRead($FScript))
					EndIf
				EndIf
		EndSelect

		; Select Button_Check-----------------------------------34
		Select
			Case $msg = $iButtonCheck
				If GUICtrlRead($FScript) = "" Or $sForms = 0 Then
					MsgBox(8192, "", "You are not chosen needed file paths")
				Else
					$iPIDfscript = Run(@ComSpec & " /k " & GUICtrlRead($Pyth) & " " & GUICtrlRead($FScript) & " " & GUICtrlRead($WordForm), "", @SW_HIDE, $STDOUT_CHILD + $STDERR_CHILD)
					Global $ResponseCheck
					While 1
						$ResponseCheck &= StdoutRead($iPIDfscript)
						If @error Then ExitLoop
					WEnd
					$ResponseCheck = StringReplace($ResponseCheck, @WorkingDir & ">", "")
					If StringInStr($ResponseCheck, "WARN") = 0 And StringInStr($ResponseCheck, "ERR") = 0 Then
						MsgBox(0, "Check Formss", $ResponseCheck & @CRLF & "The Word Forms file is OK")
					Else
						If MsgBox(1, "Check Formss", $ResponseCheck & @CRLF & "Please to view & fix :" & @CRLF & @WorkingDir & "\check_wordforms.log" & @CRLF _
								 & @CRLF & "WARN can be ignored, but some inflections will be invalid." & @CRLF & "ERR won't generate valid inflections") = 1 Then
							Run("notepad.exe " & @WorkingDir & "\check_wordforms.log", @WindowsDir, @SW_SHOWNORMAL)
						EndIf
					EndIf
					Global $ResponseCheck = ""
				EndIf
		EndSelect

		; Select File Title------------------------------------35
		Select
			Case $msg = $iButtonTitle
				$sMessageDescr = "Please select a Title."
				$Title1 = FileOpenDialog($sMessageDescr, @DesktopDir & "\", "Title File (*.*)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If @error Then
				Else
					$Title1 = StringReplace($Title1, "|", @CRLF)
					; Check file is encoding of UTF
					Local $iEncoding = FileGetEncoding($Title1) ; Retrieve the file encoding of the current script.
					If @error Then
						MsgBox(8192, "", "Error: Could not obtain the file encoding.")
					ElseIf Not ($iEncoding = 256) + ($iEncoding = 128) Then
						If MsgBox(1, "File Title", "Selected Title is not UTF 8 :" & @CRLF & $Title1 & @CRLF _
								 & @CRLF & "Do you want to edit (save in UTF-8) it in 'Notepad' ?") = 1 Then
							Run("notepad.exe " & $Title1, @WindowsDir, @SW_SHOWNORMAL)
						EndIf
					Else
						If FileGetSize($Title1) > 100 Then
							If MsgBox(257, "File Title", "Selected file : " & $Title1 & @CRLF & @CRLF _
									 & "is too large for 'Title', recommended size <100 bytes" & @CRLF _
									 & "OK to edit it in 'Notepad' or continue with selected ?") = 1 Then
								Run("notepad.exe " & $Title1, @WindowsDir, @SW_SHOWNORMAL)
							Else
								$sTit = 1
								GUICtrlSetData($Title, $Title1)
								GUICtrlSetState($ButtonTview, 16)
								GUICtrlSetState($ButtonTclean, 16)
							EndIf
						Else
							$sTit = 1
							GUICtrlSetData($Title, $Title1)
							GUICtrlSetState($ButtonTview, 16)
							GUICtrlSetState($ButtonTclean, 16)
						EndIf
					EndIf
					; Check file path for spaces.
					If StringInStr($Title1, " ") > 0 Then MsgBox(0, "", "There is a space in the 'file' path and it may not work properly.")
					;----------------------
				EndIf
		EndSelect

		; Button_Title View-----------------------------36
		Select
			Case $msg = $ButtonTview
				If $sTit = 1 Then
					Run("notepad.exe " & GUICtrlRead($Title), @WindowsDir, @SW_SHOWNORMAL)
				Else
				EndIf
		EndSelect

		;  Button_Description View----------------------37
		Select
			Case $msg = $ButtonDview
				If $sDesc = 1 Then
					Run("notepad.exe " & GUICtrlRead($Descr), @WindowsDir, @SW_SHOWNORMAL)
				Else
				EndIf
		EndSelect

				;  Button_Description Clean----------------38
		Select
			Case $msg = $ButtonDclean
				If $sDesc = 1 Then
					GUICtrlSetData($Descr, "File Descripton")
					$sDesc = 0
					GUICtrlSetState($ButtonDview, 32)
					GUICtrlSetState($ButtonDclean, 32)
				Else
				EndIf
		EndSelect

						;  Button_Title Clean---------------39
		Select
			Case $msg = $ButtonTclean
				If $sTit = 1 Then
					GUICtrlSetData($Title, "File Title")
					$sTit = 0
					GUICtrlSetState($ButtonTview, 32)
					GUICtrlSetState($ButtonTclean, 32)
				Else
				EndIf
		EndSelect

	WEnd
	Run(@ComSpec & " /c taskkill /IM cmd.exe /F", "", @SW_HIDE)
	GUIDelete($hGUI1)
	If $iPIDPack Then ProcessClose($iPIDPack)
	If $iPIDUnPack Then ProcessClose($iPIDUnPack)
	If $iPIDPackMDD Then ProcessClose($iPIDPackMDD)
	If $iPIDUnMDD Then ProcessClose($iPIDUnMDD)
	If $iPIDMeta Then ProcessClose($iPIDMeta)
	If $iPIDversPyth Then ProcessClose($iPIDversPyth)
	If $iPIDversMdict Then ProcessClose($iPIDversMdict)
	If $iPIDconv_db Then ProcessClose($iPIDconv_db)
	If $iPIDUn_db Then ProcessClose($iPIDUn_db)
	If $iPIDPack_all Then ProcessClose($iPIDPack_all)
	If $iPIDUnPack_db Then ProcessClose($iPIDUnPack_db)
	If $iPIDUnPack_zip Then ProcessClose($iPIDUnPack_zip)
	If $iPIDUnPackSplit Then ProcessClose($iPIDUnPackSplit)
	If $iPIDquery Then ProcessClose($iPIDquery)
	If $iPIDConvFlex Then ProcessClose($iPIDConvFlex)
	If $iPIDconcat Then ProcessClose($iPIDconcat)
	If $iPIDfscript Then ProcessClose($iPIDfscript)
EndFunc   ;==>MDictGUI
