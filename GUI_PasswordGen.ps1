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

    function RandomPasswordEmbedded() {
        $Random_InputRange = 100..999
        
        $Random_RandomWord = "Actor","Agent","Alarm","Angle","Award","Basic","Began","Block","Brain","Brand","Broad","Broke","Build","Cable","Carry","Chart","Claim","Class","Click","Clock","Delay","Depth","Dozen","Drawn","Dream","Dress","Drive","Drove","Empty","Enjoy","Event","Field","Fixed","Found","Frame","Fresh","Front","Fruit","Great","Heart","Heavy","Horse","Hotel","House","Ideal","Image","Index","Judge","Known","Label","Large","Limit","Links","Logic","Lunch","Magic","Major","Metal","Model","Money","Plate","Power","Proud","Prove","Quick","Quiet","Reach","Ready","River","Royal","Rural","Score","Shape","Share","Sharp","Sheet","Shelf","Smile","Sound","Spare","Speak","Speed","Spend","Table","Thing","Think","Third","Throw","Times","Tired","Title","Topic","Total","Touch","Trade","Trust","Twice","Watch","Wheel","World","Years","Young","Yummy"
        
        $Random_Exclude = 69,420,111,222,333,444,555,666,777,888,999,169,269,369,469,569,669,769,869,969,00,11,22,33,44,55,66,77,88,99,100,200,300,400,500,600,700,800,900
        
        $Random_RandomNumber = $Random_InputRange | Where-Object { $Random_Exclude -notcontains $_}
        
        $Random_RandPassword = Get-Random -InputObject $Random_RandomWord
        
        $Random_RandPassword += Get-Random -InputObject $Random_RandomNumber
        
        $RandomPasswordEmbedded
        }
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