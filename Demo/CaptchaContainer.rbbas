#tag WebPage
Begin WebContainer CaptchaContainer
   Cursor          =   0
   Enabled         =   True
   Height          =   244
   HelpTag         =   ""
   HorizontalCenter=   0
   Index           =   -2147483648
   Left            =   151
   LockBottom      =   False
   LockHorizontal  =   ""
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   ""
   Style           =   "None"
   TabOrder        =   0
   Top             =   230
   VerticalCenter  =   0
   Visible         =   True
   Width           =   318
   ZIndex          =   1
   _HorizontalPercent=   ""
   _IsEmbedded     =   ""
   _Locked         =   ""
   _NeedsRendering =   True
   _OfficialControl=   False
   _VerticalPercent=   ""
   Begin WebButton Button1
      Caption         =   "Verify"
      Cursor          =   0
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   136
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   0
      Style           =   "None"
      TabOrder        =   4
      Top             =   101
      VerticalCenter  =   0
      Visible         =   True
      Width           =   100
      ZIndex          =   1
      _HorizontalPercent=   ""
      _IsEmbedded     =   ""
      _Locked         =   ""
      _NeedsRendering =   True
      _VerticalPercent=   ""
   End
   Begin Captcha TheCaptcha1
      AlignHorizontal =   0
      AlignVertical   =   0
      Answer          =   0
      Cursor          =   0
      Enabled         =   True
      Height          =   89
      HelpTag         =   ""
      HintText        =   True
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Noisiness       =   8
      Picture         =   1662390271
      ProtectImage    =   True
      Scope           =   0
      Style           =   "None"
      TabOrder        =   -1
      TextSize        =   25
      Top             =   0
      URL             =   ""
      VerticalCenter  =   0
      Visible         =   True
      Width           =   318
      ZIndex          =   1
      _HorizontalPercent=   ""
      _IsEmbedded     =   ""
      _Locked         =   ""
      _NeedsRendering =   True
      _VerticalPercent=   ""
   End
   Begin WebTextField TextField1
      AutoCapitalize  =   True
      AutoComplete    =   True
      AutoCorrect     =   True
      Cursor          =   0
      Enabled         =   True
      HasFocusRing    =   True
      Height          =   22
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   82
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      ReadOnly        =   False
      Scope           =   0
      Style           =   "None"
      TabOrder        =   5
      Text            =   ""
      Top             =   101
      Type            =   0
      VerticalCenter  =   0
      Visible         =   True
      Width           =   42
      ZIndex          =   1
      _HorizontalPercent=   ""
      _IsEmbedded     =   ""
      _Locked         =   ""
      _NeedsRendering =   True
      _VerticalPercent=   ""
   End
   Begin WebLabel Label1
      Cursor          =   1
      Enabled         =   True
      HasFocusRing    =   True
      Height          =   44
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   109
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   True
      Scope           =   0
      Style           =   "None"
      TabOrder        =   6
      Text            =   ""
      Top             =   167
      VerticalCenter  =   0
      Visible         =   True
      Width           =   100
      ZIndex          =   1
      _HorizontalPercent=   ""
      _IsEmbedded     =   ""
      _Locked         =   ""
      _NeedsRendering =   True
      _VerticalPercent=   ""
   End
   Begin WebSlider Slider1
      Cursor          =   0
      Enabled         =   True
      Height          =   18
      HelpTag         =   "Noisiness"
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   41
      LiveStep        =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Maximum         =   100
      Minimum         =   0
      Scope           =   0
      Style           =   "None"
      TabOrder        =   -1
      Top             =   137
      Value           =   5
      VerticalCenter  =   0
      Visible         =   True
      Width           =   236
      ZIndex          =   1
      _HorizontalPercent=   ""
      _IsEmbedded     =   ""
      _Locked         =   ""
      _NeedsRendering =   True
      _VerticalPercent=   ""
   End
End
#tag EndWebPage

#tag WindowCode
#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  If Val(TextField1.Text) = TheCaptcha1.Answer Then
		    Label1.Text = "Correct!"
		    Label1.Style = Right
		  Else
		    Label1.Text = "Incorrect!"
		    Label1.Style = Wrong
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  TheCaptcha1.Noisiness = Me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Value = TheCaptcha1.Noisiness
		End Sub
	#tag EndEvent
#tag EndEvents
