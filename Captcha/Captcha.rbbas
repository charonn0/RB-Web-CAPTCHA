#tag Class
Protected Class Captcha
Inherits WebImageView
	#tag Event
		Sub MouseEnter()
		  Me.Cursor = System.WebCursors.FingerPointer
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  Me.Cursor = System.WebCursors.StandardPointer
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer, Details As REALbasic.MouseEvent)
		  #pragma Unused X
		  #pragma Unused Y
		  #pragma Unused Details
		  Me.Reload()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  If Buffer = Nil Then Buffer = New Picture(Me.Width, Me.Height, 24)
		  Reload()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  Buffer = New Picture(Me.Width, Me.Height, 24)
		  Reload()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  Load()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawNoise()
		  Dim c As Color = Buffer.Graphics.ForeColor
		  
		  For x As Integer = 0 To Buffer.Width - 1 Step Rand.InRange(10, 50)
		    For y As Integer = 0 To Buffer.Height - 1 Step Rand.InRange(10, 50)
		      'If rand.InRange(0, 10) Mod 3 = 0 Then
		      Buffer.Graphics.ForeColor = RGB(rand.InRange(0, 255), rand.InRange(0, 255), rand.InRange(0, 255))
		      Buffer.Graphics.PenHeight = rand.InRange(1, 7)
		      Buffer.Graphics.PenWidth = rand.InRange(1, 3)
		      Buffer.Graphics.FillRect(x, y, rand.InRange(1, Rand.InRange(1, 5)), rand.InRange(1, Rand.InRange(1, 5)))
		      'End If
		    Next
		  Next
		  
		  For x As Integer = 0 To Buffer.Width - 1 Step Rand.InRange(10, 50)
		    For y As Integer = 0 To Buffer.Height - 1 Step Rand.InRange(10, 50)
		      If rand.InRange(0, 15) Mod 3 = 0 Then
		        Buffer.Graphics.ForeColor = RGB(rand.InRange(0, 255), rand.InRange(0, 255), rand.InRange(0, 255))
		        Buffer.Graphics.PenHeight = rand.InRange(1, 3)
		        Buffer.Graphics.PenWidth = rand.InRange(1, 6)
		        Buffer.Graphics.FillRect(x, y, rand.InRange(1, Rand.InRange(1, 5)), rand.InRange(1, Rand.InRange(1, 5)))
		        Buffer.Graphics.DrawLine(x, y, rand.InRange(1, Me.Width), rand.InRange(1, Me.Height))
		      End If
		    Next
		  Next
		  
		  
		  Buffer.Graphics.ForeColor = c
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawText()
		  Dim strWidth, strHeight As Integer
		  Buffer.Graphics.TextSize = TextSize
		  strWidth = Buffer.Graphics.StringWidth(challenge)
		  strHeight = Buffer.Graphics.StringHeight(challenge, Me.Width)
		  Dim x, y As Integer
		  x = rand.InRange(strHeight, Me.Width - strWidth + 5)
		  y = rand.InRange(strHeight, Me.Height)
		  Buffer.Graphics.ForeColor = &c000000
		  Buffer.Graphics.TextSize = Buffer.Graphics.TextSize + 1
		  Buffer.Graphics.DrawString(challenge, x - 0.25, y - 0.25)
		  Buffer.Graphics.TextSize = Buffer.Graphics.TextSize - 1
		  Buffer.Graphics.ForeColor = RGB(rand.InRange(100, 255), rand.InRange(100, 255), rand.InRange(100, 255))
		  Buffer.Graphics.DrawString(challenge, x, y)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GenHint() As String
		  Dim ret As String = challenge
		  ret = ReplaceAll(ret, "10", "Ten")
		  ret = ReplaceAll(ret, "1", "One")
		  ret = ReplaceAll(ret, "2", "Two ")
		  ret = ReplaceAll(ret, "3", "Three ")
		  ret = ReplaceAll(ret, "4", "Four ")
		  ret = ReplaceAll(ret, "5", "Five ")
		  ret = ReplaceAll(ret, "x", "Muliplied by ")
		  ret = ReplaceAll(ret, "6", "Six ")
		  ret = ReplaceAll(ret, "7", "Seven ")
		  ret = ReplaceAll(ret, "8", "Eight ")
		  ret = ReplaceAll(ret, "9", "Nine ")
		  ret = ReplaceAll(ret, "0", "Zero ")
		  ret = ReplaceAll(ret, &U00F7, "Divided by ")
		  ret = ReplaceAll(ret, "+", "Added to ")
		  ret = ReplaceAll(ret, "-", "Subracted by ")
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Load()
		  Dim x, y, action As Integer
		  rand = New Random
		  rand.Seed = Session.ClientTime.TotalSeconds
		  
		  x = Rand.InRange(0, 10)
		  y = Rand.InRange(0, 10)
		  action = Rand.InRange(0, 3)
		  Select Case action
		  Case 0  //Add
		    Answer = x + y
		    Challenge = Str(x) + " " +  "+" + " " +  Str(y) + " = ?"
		  Case 1  //subtract
		    If x > y Then
		      Answer = x - y
		      Challenge = Str(x) + " " +  "-" + " " +  Str(y) + " = ?"
		    Else
		      Answer = y - x
		      Challenge = Str(y) + " " +  "-" + " " +  Str(x) + " = ?"
		    End If
		  Case 2  //multiply
		    Answer = x * y
		    Challenge = Str(x) + " " +  "x" + " " +  Str(y) +  " = ?"
		  Case 3  //divide
		    If x Mod y <> 0 Then
		      If x > y Then
		        For x = x To x*2
		          If x > 50 Then Exit For x
		          If x Mod y = 0 Then
		            Answer = x / y
		            Challenge = Str(x) + " ÷ " +  Str(y) +  "= ?"
		            Exit For x
		          End If
		        Next
		      Else
		        For y = y To y*2
		          If y > 50 Then Exit For y
		          If y Mod x = 0 Then
		            Answer = y / x
		            Challenge = Str(y) + " " +  &U00F7 + " " +  Str(x) + " = ?"
		            Exit For y
		          End If
		        Next
		      End If
		    End If
		    
		  End Select
		  If challenge = "" Then
		    Answer = 20 / 2
		    Challenge = Str(20) + " " +  &U00F7 + " " +  Str(2) + " = ?"
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reload()
		  Buffer = New Picture(Me.Width, Me.Height, 24)
		  Load()
		  For i As Integer = 1 To Me.Noisiness
		    drawNoise()
		  Next
		  DrawText()
		  If HintText Then
		    Me.HelpTag = GenHint
		  Else
		    Me.HelpTag = ""
		  End If
		  Me.Picture = Buffer
		End Sub
	#tag EndMethod


	#tag Note, Name = About this class
		This class implements a CAPTCHA control (https://en.wikipedia.org/wiki/CAPTCHA)
		
		Simply drag an instance of the Captcha control onto a WebPage and provide the user some way of typing and answer.
		Then, compare their Answer to the Captcha's Answer. The user may click the Captcha for a new Captcha.
		
		The Challenge presented to the user is a simple arithmetic problem using numbers 0-10 and the multply, divide, add, and subtract
		arithmetical operations (e.g. "2 + 1 = ?")
		
		A variable amount of 'Noise' can be included in the Challenge image to increase the difficulty for bots to OCR it. The Noisiness
		property controls the noise level: 0 = no noise, >0 = progressively more noise.
		
		
		
		
		
		
		Copyright (c) 2012 Andrew Lambert
		Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
		documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
		the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
		to permit persons to whom the Software is furnished to do so, subject to the following conditions:
		
		The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
		
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
		OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
		LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
		IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
		
	#tag EndNote


	#tag Property, Flags = &h0
		Answer As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Buffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Challenge As String
	#tag EndProperty

	#tag Property, Flags = &h0
		HintText As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Noisiness As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private rand As Random
	#tag EndProperty

	#tag Property, Flags = &h0
		TextSize As Integer = 12
	#tag EndProperty


	#tag Enum, Name = NoiseLevel, Type = Integer, Flags = &h0
		None
		  Light
		  Medium
		High
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AlignHorizontal"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="WebImageView"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlignVertical"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="WebImageView"
			#tag EnumValues
				"0 - Default"
				"1 - Top"
				"2 - Middle"
				"3 - Bottom"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Answer"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="challenge"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Cursor"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="WebControl"
			#tag EnumValues
				"0 - Auto"
				"1 - Standard Pointer"
				"2 - Finger Pointer"
				"3 - IBeam"
				"4 - Wait"
				"5 - Help"
				"6 - Arrow All Directions"
				"7 - Arrow North"
				"8 - Arrow South"
				"9 - Arrow East"
				"10 - Arrow West"
				"11 - Arrow North East"
				"12 - Arrow North West"
				"13 - Arrow South East"
				"14 - Arrow South West"
				"15 - Splitter East West"
				"16 - Splitter North South"
				"17 - Progress"
				"18 - No Drop"
				"19 - Not Allowed"
				"20 - Vertical IBeam"
				"21 - Crosshair"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Group="Behavior"
			InitialValue="Solve the math problem"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HintText"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HorizontalCenter"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Noisiness"
			Visible=true
			Group="Behavior"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - None"
				"2 - Light"
				"5 - Medium"
				"8 - Heavy"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProtectImage"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="WebImageView"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabOrder"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			InitialValue="12"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="URL"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="WebImageView"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticalCenter"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZIndex"
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_HorizontalPercent"
			Group="Behavior"
			Type="Double"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_IsEmbedded"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Locked"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="WebObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_NeedsRendering"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OfficialControl"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="WebControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_VerticalPercent"
			Group="Behavior"
			Type="Double"
			InheritedFrom="WebControl"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
