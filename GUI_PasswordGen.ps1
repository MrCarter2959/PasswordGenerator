# Hide PowerShell Console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)

# Load the Winforms assembly
[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms")

# Create the form
$form = New-Object Windows.Forms.Form

#Set the dialog title
$form.text = "Password Generator"


# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.Location = New-Object Drawing.Point 50,30
$label.Size = New-Object Drawing.Point 200,15
$label.text = "Generated Password Will Show Below"

# Create TextBox and set text, size and location
$textfield = New-Object Windows.Forms.TextBox
$textfield.Location = New-Object Drawing.Point 50,60
$textfield.Size = New-Object Drawing.Point 200,30

# Create Button and set text and location
$button = New-Object Windows.Forms.Button
$button.text = "Generate"
$button.Location = New-Object Drawing.Point 100,90

# Create Button to Close
$button1 = New-Object Windows.Forms.Button
$button1.Text = "Exit"
$button1.Location = New-Object Drawing.Point 100,120

# Set up event handler to extarct text from TextBox and display it on the Label.
$button.add_click({

Import-Module RandomPasswordEmbedded
$Password = RandomPasswordEmbedded

$textfield.Text = $Password

})

$button1.add_click({[System.Environment]::Exit(0)})

# Add the controls to the Form
$form.controls.add($button)
$form.controls.add($button1)
$form.controls.add($label)
$form.controls.add($textfield)
$form.Topmost = $true
$Form.SizeGripStyle = "Hide"
$form.StartPosition = 'CenterScreen'
# Display the dialog
$form.ShowDialog()