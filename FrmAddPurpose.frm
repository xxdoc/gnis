VERSION 5.00
Begin VB.Form FrmAddPurpose 
   BackColor       =   &H00F9F9F9&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Add Purpose"
   ClientHeight    =   2220
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4710
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2220
   ScaleWidth      =   4710
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtUserName 
      Alignment       =   2  'Center
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Top             =   870
      Width           =   4095
   End
   Begin VB.CommandButton CmdCancel 
      BackColor       =   &H80000009&
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1440
      Width           =   1695
   End
   Begin VB.CommandButton CmdOk 
      BackColor       =   &H80000009&
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   1440
      Width           =   1695
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Purpose"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   1890
      TabIndex        =   4
      Top             =   120
      Width           =   825
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Description"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00555555&
      Height          =   240
      Left            =   1800
      TabIndex        =   3
      Top             =   600
      Width           =   1095
   End
   Begin VB.Shape Shape4 
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00C48546&
      Height          =   420
      Left            =   240
      Top             =   840
      Width           =   4335
   End
   Begin VB.Shape Shape5 
      BorderColor     =   &H000080FF&
      FillColor       =   &H000080FF&
      FillStyle       =   0  'Solid
      Height          =   405
      Left            =   0
      Top             =   0
      Width           =   4725
   End
End
Attribute VB_Name = "FrmAddPurpose"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdCancel_Click()
Me.Hide
End Sub

Private Sub CmdOk_Click()
If Trim(Me.txtUserName.Text) <> "" Then
On Error GoTo hell
   cnn.Execute "insert into Purpose_Lib (Purpose) values('" & Replace(Trim(Me.txtUserName.Text), "'", "''") & "')"
   Me.Hide
End If

Exit Sub
hell:
If Err.Number = -2147217900 Then
    MsgBox "Purpose already exist.", vbInformation, "Purpose Library"
End If
End Sub

Private Sub Form_Activate()
Me.txtUserName.Text = ""
Me.txtUserName.SetFocus
End Sub