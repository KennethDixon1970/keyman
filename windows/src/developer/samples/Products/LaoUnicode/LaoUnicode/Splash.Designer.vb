<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class SplashForm
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.Label1 = New System.Windows.Forms.Label
        Me.ActivateButton = New System.Windows.Forms.Button
        Me.EvaluateButton = New System.Windows.Forms.Button
        Me.ExitButton = New System.Windows.Forms.Button
        Me.BuyButton = New System.Windows.Forms.Button
        Me.Label2 = New System.Windows.Forms.Label
        Me.TrialDayLabel = New System.Windows.Forms.Label
        Me.SplashHideTimer = New System.Windows.Forms.Timer(Me.components)
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Arial", 15.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(12, 9)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(367, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Tavultesoft Sample Product Lao Unicode"
        '
        'ActivateButton
        '
        Me.ActivateButton.Location = New System.Drawing.Point(142, 231)
        Me.ActivateButton.Name = "ActivateButton"
        Me.ActivateButton.Size = New System.Drawing.Size(75, 23)
        Me.ActivateButton.TabIndex = 1
        Me.ActivateButton.Text = "&Activate"
        Me.ActivateButton.UseVisualStyleBackColor = True
        '
        'EvaluateButton
        '
        Me.EvaluateButton.Location = New System.Drawing.Point(223, 231)
        Me.EvaluateButton.Name = "EvaluateButton"
        Me.EvaluateButton.Size = New System.Drawing.Size(75, 23)
        Me.EvaluateButton.TabIndex = 2
        Me.EvaluateButton.Text = "&Evaluate"
        Me.EvaluateButton.UseVisualStyleBackColor = True
        '
        'ExitButton
        '
        Me.ExitButton.Location = New System.Drawing.Point(304, 231)
        Me.ExitButton.Name = "ExitButton"
        Me.ExitButton.Size = New System.Drawing.Size(75, 23)
        Me.ExitButton.TabIndex = 3
        Me.ExitButton.Text = "E&xit"
        Me.ExitButton.UseVisualStyleBackColor = True
        '
        'BuyButton
        '
        Me.BuyButton.Location = New System.Drawing.Point(61, 231)
        Me.BuyButton.Name = "BuyButton"
        Me.BuyButton.Size = New System.Drawing.Size(75, 23)
        Me.BuyButton.TabIndex = 4
        Me.BuyButton.Text = "&Buy"
        Me.BuyButton.UseVisualStyleBackColor = True
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Code2000", 80.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(95, 57)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(203, 135)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "ລາວ"
        '
        'TrialDayLabel
        '
        Me.TrialDayLabel.AutoSize = True
        Me.TrialDayLabel.Location = New System.Drawing.Point(64, 208)
        Me.TrialDayLabel.Name = "TrialDayLabel"
        Me.TrialDayLabel.Size = New System.Drawing.Size(115, 13)
        Me.TrialDayLabel.TabIndex = 6
        Me.TrialDayLabel.Text = "You are on day 3 of 30"
        '
        'SplashHideTimer
        '
        Me.SplashHideTimer.Interval = 3000
        '
        'SplashForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(390, 266)
        Me.Controls.Add(Me.TrialDayLabel)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.BuyButton)
        Me.Controls.Add(Me.ExitButton)
        Me.Controls.Add(Me.EvaluateButton)
        Me.Controls.Add(Me.ActivateButton)
        Me.Controls.Add(Me.Label1)
        Me.Name = "SplashForm"
        Me.Text = "Lao Unicode Product"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents ActivateButton As System.Windows.Forms.Button
    Friend WithEvents EvaluateButton As System.Windows.Forms.Button
    Friend WithEvents ExitButton As System.Windows.Forms.Button
    Friend WithEvents BuyButton As System.Windows.Forms.Button
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents TrialDayLabel As System.Windows.Forms.Label
    Friend WithEvents SplashHideTimer As System.Windows.Forms.Timer

End Class
