#Assembel the Forms and Drawing functions
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

####initial form
$Form = New-Object Windows.Forms.Form
$Form.Text = "***Example Form GUI***"
$Form.Width = 300
$Form.Height = 420

####text input
$Textbox = New-Object System.Windows.Forms.textbox
$Textbox.Text = "textbox"
$Textbox.Multiline = $true
$Textbox.Width = 100
$Textbox.Height = 100
$Textbox.Location = New-Object System.Drawing.Point(10,10)
$Form.Controls.Add($Textbox)
#lable your shit. User needs to know what to do.
$labelTextbox = New-Object System.Windows.Forms.Label
$labelTextbox.Text = "A text box that a user can input data. This data can then be parsed using the objects .Text function."
$labelTextbox.Width = 150
$labelTextbox.Height = 100
$labelTextbox.Location = New-Object System.Drawing.Point(110,10)
$Form.Controls.Add($labelTextbox)

####List of selectable choices
$Listchoice = New-Object System.Windows.Forms.ListBox
$Listchoice.Width = 100
$Listchoice.Height = 100
$Listchoice.Location = New-Object System.Drawing.Point(10,120)
$Form.Controls.Add($Listchoice)
#list of options
[void] $Listchoice.Items.Add('Choice1')
[void] $Listchoice.Items.Add('Choice2')
[void] $Listchoice.Items.Add('Choice3')
[void] $Listchoice.Items.Add('Choice4')
#lable your shit. User needs to know what to do.
$labelListchoice = New-Object System.Windows.Forms.Label
$labelListchoice.Text = "A list of choices that can be used to have the user choose from. The selected choice can be called using the Objects .SelectedItem function"
$labelListchoice.Width = 150
$labelListchoice.Height = 100
$labelListchoice.Location = New-Object System.Drawing.Point(110,120)
$Form.Controls.Add($labelListchoice)

####Check box that can be used for calling switches.
$Option = New-Object System.Windows.Forms.CheckBox
$Option.Text = "Selectable"
$Option.Width = 100
$Option.Height = 20
$Option.Location = New-Object System.Drawing.Point(10,220)
$Option.CheckState = [System.Windows.Forms.CheckState]::Unchecked
$Form.Controls.Add($Option)
#text that can be used if the user selects the check box.
$OptionText = New-Object System.Windows.Forms.textbox
$OptionText.Text = "Type Something"
$OptionText.Multiline = $false
$OptionText.Width = 100
$OptionText.Height = 100
$OptionText.Location = New-Object System.Drawing.Point(10,240)
$Form.Controls.Add($OptionText)
#lable your shit. User needs to know what to do.
$labelOption = New-Object System.Windows.Forms.Label
$labelOption.Text = "If the checkbox is selected the text is printed. This is accomplished using the Objects .CheckState with an if loop."
$labelOption.Width = 150
$labelOption.Height = 100
$labelOption.Location = New-Object System.Drawing.Point(110,220)
$Form.Controls.Add($labelOption)

#Complete and submit form
$Ok = New-Object System.Windows.Forms.Button
$Ok.Text = "Ok"
$Ok.Width = 100
$Ok.Height = 20
$Ok.Location = New-Object System.Drawing.Point(10,330)
$Ok.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Form.Controls.Add($Ok)

#Cancel and quit
$Cancel = New-Object System.Windows.Forms.Button
$Cancel.Text = "Cancel"
$Cancel.Width = 100
$Cancel.Height = 20
$Cancel.Location = New-Object System.Drawing.Point(10,350)
$Cancel.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$Form.Controls.Add($Cancel)

#I seem to be able to run with the Activate line. ShowDialog seems to be the output of the form.
#$Form.Add_Shown({$Form.Activate()})
#$Form.ShowDialog()

#If the Ok button is selected do something
if ($Form.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    
    #Echos each line in the textbox, split by line
    $list = $Textbox.Text.Split("`n")
    foreach ($i in $list) {
        echo "You entered:  $i"
    }

    #Echos the choice you selected
    $choice = $Listchoice.SelectedItem
    echo "You chose: $choice"

    #Echos the text if you checked the box.
    if ($Option.CheckState -eq [System.Windows.Forms.CheckState]::Checked) {
        $SwitchText = $OptionText.Text
        echo "This is the text you chose to add: $SwitchText"
    } else {
        echo "You did not check the box."
    }

}