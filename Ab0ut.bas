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
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Dim tb As Label
	Dim su As StringUtils
	Dim p As PhoneIntents
	Dim lstOne As ListView
	Dim ph As Phone
	Dim lct As Label
	
	Dim share As Button
	Dim sbg As BitmapDrawable
	Dim B As AdView
End Sub

Sub Activity_Create(FirstTime As Boolean)
	ph.SetScreenOrientation(1)
	Activity.Color = Colors.White
	tb.Initialize("")
	tb.Color = Colors.rgb(0, 150, 136)
	tb.Text = "About"
	tb.TextColor = Colors.White
	tb.TextSize = 20
	tb.Gravity = Gravity.CENTER
	tb.Typeface = Typeface.DEFAULT_BOLD
	Activity.AddView(tb,0%x,0%y,100%x,55dip)
	
	share.Initialize("share")
	sbg.Initialize(LoadBitmap(File.DirAssets,"share.png"))
	share.Background = sbg
	share.Gravity = Gravity.FILL
	Activity.AddView(share,100%x-40dip,12.5dip,30dip,30dip)
	
	Dim imvLogo As ImageView
	imvLogo.Initialize ("imv")
	imvLogo.Bitmap = LoadBitmap(File.DirAssets , "icon.png")
	imvLogo.Gravity = Gravity.FILL
	Activity.AddView ( imvLogo , 50%x - 50dip  , 62dip ,  100dip  ,  100dip )
	
	Dim lblName As  Label
	Dim bg As ColorDrawable
	bg.Initialize (Colors.DarkGray , 10dip)
	lblName.Initialize ("lbname")
	lblName.Background = bg
	lblName.Gravity = Gravity.CENTER
	lblName.Text = "Myanmar Text Cloner"
	lblName.TextSize = 15
	lblName.TextColor = Colors.White
	Activity.AddView (lblName , 50%x - 90dip , (imvLogo.Height+imvLogo.Top)+7dip , 180dip , 50dip)
	lblName.Height = su.MeasureMultilineTextHeight (lblName, lblName.Text ) + 5dip
	
	Dim c As ColorDrawable
	c.Initialize (Colors.rgb(103, 58, 183), 10dip )
	lstOne.Initialize ("lstOnes")
	lstOne.Background = c
	lstOne.SingleLineLayout .Label.TextSize = 12
	lstOne.SingleLineLayout .Label .TextColor = Colors.White
	lstOne.SingleLineLayout .Label .Gravity = Gravity.CENTER
	lstOne.SingleLineLayout .ItemHeight = 40dip
	lstOne.AddSingleLine2("App Name : Myanmar Text Cloner",1)
	lstOne.AddSingleLine2("App Version : 1.0",2)
	lstOne.AddSingleLine2 ("Developed By : Myanmar Android App    ", 4)
	lstOne.AddSingleLine2 ("Website : www.MyanmarAndroidApp.com  ", 5)
	lstOne.AddSingleLine2 ("Facebook : www.fb.com/MmFreeAndroidApps   ", 6)
	Activity.AddView ( lstOne, 30dip , lblName.Height+lblName.top+7dip , 100%x -  60dip, 200dip)
	
	lct.Initialize ("lct")
	lct.TextColor = Colors.Black
	lct.TextSize = 13
	lct.Gravity = Gravity.CENTER
	lct.Text = "If You have any Problem You can contact Me Here."
	Activity.AddView (lct, 10dip,(lstOne.Top+lstOne.Height)+3%y, 100%x - 20dip, 50dip)
	lct.Height = su.MeasureMultilineTextHeight (lct, lct.Text )
	
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
End Sub

Sub lbname_Click
	StartActivity(p.OpenBrowser("http://www.MyanmarAndroidApp.com/search?q=MM+Text+Cloner"))
End Sub

Sub lblCredit_Click
	Try
		Dim Facebook As Intent
		Facebook.Initialize(Facebook.ACTION_VIEW, "fb://page/627699334104477")
		StartActivity(Facebook)
	Catch
		Dim Facebook As Intent
		Facebook.Initialize(Facebook.ACTION_VIEW, "https://m.facebook.com/MmFreeAndroidApps")
		StartActivity(Facebook)
	End Try
End Sub


Sub lstOnes_ItemClick (Position As Int, Value As Object)
	Select Value
		Case 1
			StartActivity(p.OpenBrowser("http://www.MyanmarAndroidApp.com/search?q=MM+Text+Cloner"))
		Case 3
			Try
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "fb://page/627699334104477")
				StartActivity(Facebook)
			Catch
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "https://m.facebook.com/MmFreeAndroidApps")
				StartActivity(Facebook)
			End Try
		Case 4
			Try
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "fb://page/627699334104477")
				StartActivity(Facebook)
			Catch
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "https://m.facebook.com/MmFreeAndroidApps")
				StartActivity(Facebook)
			End Try
		Case 5
			StartActivity(p.OpenBrowser("http://www.MyanmarAndroidApp.com"))
		Case 6
			Try
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "fb://page/627699334104477")
				StartActivity(Facebook)
			Catch
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "https://m.facebook.com/MmFreeAndroidApps")
				StartActivity(Facebook)
			End Try
	End Select
End Sub

Sub Activity_Resume
     
End Sub

Sub Activity_Pause (UserClosed As Boolean)
     
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