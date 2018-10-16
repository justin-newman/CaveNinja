[int]$health=100;
[int]$shuriken=3;
$sword=$false;

function ChangeTitle($health, $shuriken) {

    if(!$sword) { 
        $host.ui.RawUI.WindowTitle = "洞窟 忍者 (Cave Ninja) | Health: $health 健 | Shuriken: $shuriken 手裏剣"
    }
    else{
        $host.ui.RawUI.WindowTitle = "洞窟 忍者 (Cave Ninja) | Health: $health 健 | Shuriken: $shuriken 手裏剣 | ** Sword of Life **" 
    }
}

function CheckShuriken($shuriken) {
    if ([int]$shuriken -eq 0) {
        Write-Error "You Lack Discipline! You are out of Shurikens."
    }
    else {
    }
}

function Fight($shuriken, $sword){
    if($sword){
        do
        {
            $userResponse = Read-Host -Prompt "How do you want to fight? Answer (Throw Shuriken or Use Sword)"
        }
        while($userResponse -notlike "Shuriken" -and $userResponse -notlike "Sword")
       
        Write-Host ""

        Switch ($userResponse) 
        { 
            "Throw Shuriken" {Throw-Shuriken $shuriken}
            "Use Sword" {Use-Sword}
        }
    }
    else {Throw-Shuriken $shuriken}

}

function Fight-Skeleton($sword) {
    Write-Host "You can try to jump over the skeleton or try to kill it."
    do
    {
        $userResponse = Read-Host -Prompt "What will you do? Answer (Jump or Fight)"
    }
    while($userResponse -notlike "Jump" -and $userResponse -notlike "Fight")
       
    Write-Host ""

    Switch ($userResponse) 
    { 
        "Jump" {Dodge $sword}
        "Fight" {Fight $sword}
    }

    $battleRoll = Get-Random -Maximum 4 -Minimum 1
    if ($battleRoll = 1){
        Write-Host "Your shuriken hits the skeleton right in the face. It crumbles quickly to the floor."
    }
    elseif ($battleRoll = 2){
        Write-Host "Your shuriken hits the skeleton in the shoulder. It barely notices!"
        Fight-Skeleton $sword
    }
    elseif ($battleRoll = 3){
        Write-Host "You completely missed! What a terrible throw!"
        Fight-Skeleton $sword
    }

}

function Fight-Troll($sword) {
    Write-Host "You can try to ninja past the troll or try to kill it."
    do
    {
        $userResponse = Read-Host -Prompt "What will you do? Answer (Ninja or Fight)"
    }
    while($userResponse -notlike "Ninja" -and $userResponse -notlike "Fight")
       
    Write-Host ""

    Switch ($userResponse) 
    { 
        "Ninja" {
            Write-Host "The troll smells your blood. He wraps his giant hand around your body and rips off both of your arms."
            Write-Host "Then he throws you to the ground and slowly presses down on your head with his foot until he feels that satisfying 'POP!'"
        }
        "Fight" {Fight-Troll $sword}
    }
}

function Throw-Shuriken($shuriken) {
    CheckShuriken $shuriken
    --$shuriken;
    Write-Host 'You Threw A Shuriken!'
    ChangeTitle $health $shuriken
}

function OpenChest() {
    # 0 = Health 1 = Shuriken
    $item = Get-Random -Maximum 2
    
    if ($item = 0){
        $numOfItem = Get-Random -Maximum 4 -Minimum 1
        $shuriken = ($shuriken + $numOfItem)
        if ($numOfItem = 1){
            Write-Host "You Got 1 Shuriken!"
        }else{
            Write-Host "You Got $numOfItem Shurikens!"
        }

    }else{
        $numOfItem = Get-Random -Maximum 50 -Minimum 10
        $health = ($health + $numOfItem)
        Write-Host "You Got $numOfItem Health!"
    }
    ChangeTitle $health $shuriken
}

function Use-Sword() {
    Write-Host "Use Sword"
}

function LoadingBar($message) {
    for ($i=0;$i -lt 250; $i++) {
        $percentComplete = ($i / 250) * 100
        Write-Progress -Activity $message -PercentComplete $percentComplete
    }
    Write-Progress -Activity $message -Completed

}

function Start-Game(){
Write-Host "Welcome Fellow 忍者 (Ninja)"

    $userResponse = Read-Host -Prompt "Press Any Key to Play or Q to quit"
    if ($userResponse -like 'q'){

        Clear-Host
        Write-Host "You Lack Discipline!"
        break
    }else {
        Clear-Host
        LoadingBar 'Loading Your Adventure'
        
        Write-Host "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        Write-Host "!                                                                                                            !"
        Write-Host "!                                         Your name is ワサビ (Wasabi)                                         !"
        Write-Host "!                         You have arrived at the ancient Cave of Fallen Shadows.                            !"
        Write-Host "!        The prophecy says that only one worthy ninja may enter this cave and obtain the Emerald Eye.        !"
        Write-Host "!                 You are not the first to attempt this feat. None, so far, have succeeded.                  !"
        Write-Host "!                                   You will almost certainly die.                                           !"
        Write-Host "!                                                                                                            !"
        Write-Host "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        Write-Host "                                                                                                              "

        ChangeTitle $health $shuriken

        Instructions
    }
}

function Instructions(){
    Write-Host "You enter the cave with full health and 3 shurikens." -ForegroundColor Yellow
    Sleep 2
    Write-Host "You can find your current totals of each in the title bar at the top of this window." -ForegroundColor Yellow
    Sleep 2
    Write-Host "Any further instructions will be provided when, and only when, absolutely necessary." -ForegroundColor Yellow
    Sleep 1

    $userResponse = Read-Host -Prompt "Press Any Key to enter The Cave of Fallen Shadows or Q to quit"
    if ($userResponse -like 'q'){

        Clear-Host
        Write-Host "You Lack Discipline!"
        break
    }else {
        Clear-Host
        LoadingBar 'Entering The Cave of Fallen Shadows'
    }
}

Start-Game

Write-Host "You are immediately met by three beasts! Two skeletons, one on each side and a giant troll in the middle."
Write-Host "They are super fuckin' pissed and closing in on you. Take action, quickly!"
    do
    {
        $userResponse = Read-Host -Prompt "What will you do? Answer (Go Left, Go Straight, or Go Right)"
    }
    while($userResponse -notlike "Go Left" -and $userResponse -notlike "Go Straight" -and $userResponse -notlike "Go Right")
       
    Write-Host ""

    Switch ($userResponse) 
    { 
        "Go Left" {Fight-Skeleton $sword}
        "Go Straight" {Fight-Troll $sword}
        "Go Right" {Fight-Skeleton $sword} 
    }
