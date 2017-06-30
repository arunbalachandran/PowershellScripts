Dim iterations
iterations = 0
breakText = "End of break"
Do While iterations < 4
	iterations = iterations + 1
	messageText = "This is is iteration number " & iteration & vbNewLine & "You have 5 minute break."
	Wscript.Sleep 1500000
	MsgBox messageText
	Wscript.Sleep 300000
	MsgBox breakText	
Loop
