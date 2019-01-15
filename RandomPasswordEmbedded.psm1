function RandomPasswordEmbedded() {
$Random_InputRange = 100..999

$Random_RandomWord = "Actor","Agent","Alarm","Angle","Award","Basic","Began","Block","Brain","Brand","Broad","Broke","Build","Cable","Carry","Chart","Claim","Class","Click","Clock","Delay","Depth","Dozen","Drawn","Dream","Dress","Drive","Drove","Empty","Enjoy","Event","Field","Fixed","Found","Frame","Fresh","Front","Fruit","Great","Heart","Heavy","Horse","Hotel","House","Ideal","Image","Index","Judge","Known","Label","Large","Limit","Links","Logic","Lunch","Magic","Major","Metal","Model","Money","Plate","Power","Proud","Prove","Quick","Quiet","Reach","Ready","River","Royal","Rural","Score","Shape","Share","Sharp","Sheet","Shelf","Smile","Sound","Spare","Speak","Speed","Spend","Table","Thing","Think","Third","Throw","Times","Tired","Title","Topic","Total","Touch","Trade","Trust","Twice","Watch","Wheel","World","Years","Young","Yummy"

$Random_Exclude = 69,420,111,222,333,444,555,666,777,888,999,169,269,369,469,569,669,769,869,969,00,11,22,33,44,55,66,77,88,99,100,200,300,400,500,600,700,800,900

$Random_RandomNumber = $Random_InputRange | Where-Object { $Random_Exclude -notcontains $_}

$Random_RandPassword = Get-Random -InputObject $Random_RandomWord

$Random_RandPassword += Get-Random -InputObject $Random_RandomNumber
}