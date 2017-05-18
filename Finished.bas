Type=Activity
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: false
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals
Dim edt As EditText
Dim edtbg As ColorDrawable

Dim b1,b2 As Button
Dim b1bg,b2bg As ColorDrawable
Dim cp As BClipboard
Dim tb As Label

	Dim B As AdView
	Dim I As InterstitialAd
	Dim N As NativeExpressAd
	
	Dim share,about As Button
	Dim abg, sbg As BitmapDrawable
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.Color = Colors.White
	tb.Initialize("")
	tb.Color = Colors.rgb(103, 58, 183)
	tb.Gravity = Gravity.CENTER
	tb.TextColor = Colors.White
	tb.Text = "Myanmar Text Cloner"
	tb.TextSize = 20
	Activity.AddView(tb,0%x,0%y,100%x,55dip)
	
	abg.Initialize(LoadBitmap(File.DirAssets,"about.png"))
	about.Initialize("about")
	about.Background = abg
	about.Gravity = Gravity.CENTER
	Activity.AddView(about,10dip,12.5dip,30dip,30dip)
	
	sbg.Initialize(LoadBitmap(File.DirAssets,"share.png"))
	share.Initialize("share")
	share.Background = sbg
	share.Gravity = Gravity.CENTER
	Activity.AddView(share,100%x - 40dip,12.5dip,30dip,30dip)
	
	edtbg.Initialize(Colors.DarkGray,10)
	edt.Initialize("edt")
	edt.Text = cp.getText
	edt.Background = edtbg
	edt.Gravity = Gravity.CENTER
	edt.TextColor = Colors.White
	Activity.AddView(edt,10dip,55dip+10dip,100%x - 20dip,40%y)
	
	b1bg.Initialize(Colors.rgb(0, 150, 136),10)
	b1.Initialize("b1")
	b1.Text = "Copy"
	b1.Background = b1bg
	Activity.AddView(b1,2%x,edt.Top+edt.Height+2%y,45%x,50dip)
	
	b2bg.Initialize(Colors.rgb(255, 87, 34),10)
	b2.Initialize("b2")
	b2.Text = "Send"
	b2.Background = b2bg
	Activity.AddView(b2,53%x,edt.Top+edt.Height+2%y,45%x,50dip)
	

	'Banner ADs
	B.Initialize2("B","ca-app-pub-4173348573252986/6656103359",B.SIZE_SMART_BANNER)
	Dim height As Int
	If GetDeviceLayoutValues.ApproximateScreenSize < 6 Then
		If 100%x > 100%y Then height = 32dip Else height = 50dip
	Else
		height = 90dip
	End If
	Activity.AddView(B, 0dip, 100%y - height, 100%x, height)
	B.LoadAd
	Log(B)
	
	'Interstitial Ads
	I.Initialize("I","ca-app-pub-4173348573252986/8132836558")
	I.LoadAd
	If I.Ready = False Then
		I.LoadAd
	End If
	
	'Native Ads
	N.Initialize("N","ca-app-pub-4173348573252986/2086302957",100%x,150dip)
	N.LoadAd
	Activity.AddView(N,0%x,b1.Top+b1.Height+1%y,100%x,150dip)
	
End Sub

Sub b1_CLick
	cp.setText(edt.Text)
	ToastMessageShow("Text Copied! Now You Can Paste :)",True)
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b2_Click
	Dim ShareIt As Intent
	cp.clrText
	cp.setText(edt.Text)
	ShareIt.Initialize (ShareIt.ACTION_SEND,"")
	ShareIt.SetType ("text/plain")
	ShareIt.PutExtra ("android.intent.extra.TEXT",cp.getText)
	ShareIt.PutExtra ("android.intent.extra.SUBJECT","Get Free!!")
	ShareIt.WrapAsIntentChooser("Share Text Via...")
	StartActivity (ShareIt)
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

'Banner Ads
Sub B_FailedToReceiveAd (ErrorCode As String)
	Log("B failed: " & ErrorCode)
End Sub
Sub B_ReceiveAd
	Log("B received")
End Sub

Sub B_AdScreenDismissed
	Log("B Dismissed")
End Sub

'Interstitial Ads
Sub I_AdClosed
	I.LoadAd
End Sub

Sub I_ReceiveAd
	Log("I Received")
End Sub

Sub I_FailedToReceiveAd (ErrorCode As String)
	Log("I not Received - " &"Error Code: "&ErrorCode)
	I.LoadAd
End Sub

Sub I_adopened
	Log("I Opened")
End Sub

'Native Ads

Sub N_FailedToReceiveAd (ErrorCode As String)
	Log("N failed: " & ErrorCode)
End Sub
Sub N_ReceiveAd
	Log("N received")
End Sub

Sub N_AdScreenDismissed
	Log("N Dismissed")
End Sub

Sub share_Click
	Dim ShareIt As Intent
	Dim copy As BClipboard
	copy.clrText
	copy.setText("Myanmar Text Cloner! စာေၾကာင္းတစ္ခု၊ စာသားတစ္ခုကိုအမ်ားႀကီးပြားေပးနိုင္ပါတယ္။	ဥပမာ။  ။ ငါနင့္ကိုခ်စ္တယ္ ဆိုတဲ့စာသားတစ္ေၾကာင္းကို အေၾကာင္း ၁၀၀ ေလာက္ေရးခ်င္တဲ့အခါ ကိုယ္တိုင္လက္နဲ႔ေရးရင္အၾကာႀကီးေရးရမွာပါ။ 	copy ကူးၿပီး Paste ျပန္ခ်မယ္ဆိုရင္လည္းထပ္ခါထပ္ခါ Paste လုပ္ေနရပါလိမ့္မယ္။	ဒီ App ေလးနဲ႔သာဆိုရင္ ခ်က္ခ်င္းအေၾကာင္း ၁၀၀ ေလာက္ထုတ္ခ်င္ရင္လည္း တစ္ခ်က္ႏွိပ္႐ုံနဲ႔ အေၾကာင္းတစ္ရာထုတ္ေပးပါလိမ့္မယ္။	၁၀၀၀ ထုတ္ခ်င္ရင္လည္း အေၾကာင္း ၁၀၀၀ ထုတ္ျပေပးပါလိမ့္မယ္။	ကိုယ္က copy ယူၿပီး Paste လုပ္ကာျပန္ပို႔႐ုံပါပဲ ;) Download Free at : http://www.MyanmarAndroidApp.com/search?q=MM+Text+Cloner"&CRLF&"#MyanmarTextCloner")
	ShareIt.Initialize (ShareIt.ACTION_SEND,"")
	ShareIt.SetType ("text/plain")
	ShareIt.PutExtra ("android.intent.extra.TEXT",copy.getText)
	ShareIt.PutExtra ("android.intent.extra.SUBJECT","Get Free!!")
	ShareIt.WrapAsIntentChooser("Share App Via...")
	StartActivity (ShareIt)
End Sub

Sub about_Click
	StartActivity(Ab0ut)
	If I.Ready Then I.Show Else I.LoadAd
End Sub