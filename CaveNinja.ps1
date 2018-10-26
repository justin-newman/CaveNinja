
[int]$global:health=0;
[int]$global:shuriken=0;
$global:haveShuriken=$true;
$global:sword=$false;


function ChangeTitle() {

    if(!$global:sword) { 
        $host.ui.RawUI.WindowTitle = "洞窟 忍者 (Cave Ninja) | Health: $global:health 健 | Shuriken: $global:shuriken 手裏剣"
    }
    else{
        $host.ui.RawUI.WindowTitle = "洞窟 忍者 (Cave Ninja) | Health: $global:health 健 | Shuriken: $global:shuriken 手裏剣 | ** Sword of Life **" 
    }
}

function Quit() {
    Clear-Host

    Write-Host "`
     ▓██   ██▓ ▒█████   █    ██     ██▓    ▄▄▄       ▄████▄   ██ ▄█▀`
      ▒██  ██▒▒██▒  ██▒ ██  ▓██▒   ▓██▒   ▒████▄    ▒██▀ ▀█   ██▄█▒ `
       ▒██ ██░▒██░  ██▒▓██  ▒██░   ▒██░   ▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ `
       ░ ▐██▓░▒██   ██░▓▓█  ░██░   ▒██░   ░██▄▄▄▄██ ▒▓█▄ ▄██▒▓██ █▄ `
       ░ ██▒▓░░ ████▓▒░▒▒█████▓    ░██████▒▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄`
        ██▒▒▒ ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒    ░ ▒░▓  ░▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒`
      ▓██ ░▒░   ░ ▒ ▒░ ░░▒░ ░ ░    ░ ░ ▒  ░ ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░`
      ▒ ▒ ░░  ░ ░ ░ ▒   ░░░ ░ ░      ░ ░    ░   ▒   ░        ░ ░░ ░ `
      ░ ░         ░ ░     ░            ░  ░     ░  ░░ ░      ░  ░   `
      `
      ▓█████▄  ██▓  ██████  ▄████▄   ██▓ ██▓███   ██▓     ██▓ ███▄    █ ▓█████` 
      ▒██▀ ██▌▓██▒▒██    ▒ ▒██▀ ▀█  ▓██▒▓██░  ██▒▓██▒    ▓██▒ ██ ▀█   █ ▓█   ▀` 
      ░██   █▌▒██▒░ ▓██▄   ▒▓█    ▄ ▒██▒▓██░ ██▓▒▒██░    ▒██▒▓██  ▀█ ██▒▒███   `
      ░▓█▄   ▌░██░  ▒   ██▒▒▓█▄ ▄██▒░██░▒██▄█▓▒ ▒▒██░    ░██░▓██▒  ▐▌██▒▒▓█  ▄ `
      ░▒████▓ ░██░▒██████▒▒▒ ▓███▀ ░░██░▒██▒ ░  ░░██████▒░██░▒██░   ▓██░░▒████▒`
       ▒▒▓  ▒ ░▓  ▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░░▓  ▒▓▒░ ░  ░░ ▒░▓  ░░▓  ░ ▒░   ▒ ▒ ░░ ▒░ ░`
       ░ ▒  ▒  ▒ ░░ ░▒  ░ ░  ░  ▒    ▒ ░░▒ ░     ░ ░ ▒  ░ ▒ ░░ ░░   ░ ▒░ ░ ░  ░`
       ░ ░  ░  ▒ ░░  ░  ░  ░         ▒ ░░░         ░ ░    ▒ ░   ░   ░ ░    ░   `
         ░     ░        ░  ░ ░       ░               ░  ░ ░           ░    ░  ░"

    break
}

function Dead() {

    Write-Host "`
     ▓██   ██▓ ▒█████   █    ██     ██▓    ▄▄▄       ▄████▄   ██ ▄█▀`
      ▒██  ██▒▒██▒  ██▒ ██  ▓██▒   ▓██▒   ▒████▄    ▒██▀ ▀█   ██▄█▒ `
       ▒██ ██░▒██░  ██▒▓██  ▒██░   ▒██░   ▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ `
       ░ ▐██▓░▒██   ██░▓▓█  ░██░   ▒██░   ░██▄▄▄▄██ ▒▓█▄ ▄██▒▓██ █▄ `
       ░ ██▒▓░░ ████▓▒░▒▒█████▓    ░██████▒▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄`
        ██▒▒▒ ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒    ░ ▒░▓  ░▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒`
      ▓██ ░▒░   ░ ▒ ▒░ ░░▒░ ░ ░    ░ ░ ▒  ░ ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░`
      ▒ ▒ ░░  ░ ░ ░ ▒   ░░░ ░ ░      ░ ░    ░   ▒   ░        ░ ░░ ░ `
      ░ ░         ░ ░     ░            ░  ░     ░  ░░ ░      ░  ░   `
      `
      ▓█████▄  ██▓  ██████  ▄████▄   ██▓ ██▓███   ██▓     ██▓ ███▄    █ ▓█████` 
      ▒██▀ ██▌▓██▒▒██    ▒ ▒██▀ ▀█  ▓██▒▓██░  ██▒▓██▒    ▓██▒ ██ ▀█   █ ▓█   ▀` 
      ░██   █▌▒██▒░ ▓██▄   ▒▓█    ▄ ▒██▒▓██░ ██▓▒▒██░    ▒██▒▓██  ▀█ ██▒▒███   `
      ░▓█▄   ▌░██░  ▒   ██▒▒▓█▄ ▄██▒░██░▒██▄█▓▒ ▒▒██░    ░██░▓██▒  ▐▌██▒▒▓█  ▄ `
      ░▒████▓ ░██░▒██████▒▒▒ ▓███▀ ░░██░▒██▒ ░  ░░██████▒░██░▒██░   ▓██░░▒████▒`
       ▒▒▓  ▒ ░▓  ▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░░▓  ▒▓▒░ ░  ░░ ▒░▓  ░░▓  ░ ▒░   ▒ ▒ ░░ ▒░ ░`
       ░ ▒  ▒  ▒ ░░ ░▒  ░ ░  ░  ▒    ▒ ░░▒ ░     ░ ░ ▒  ░ ▒ ░░ ░░   ░ ▒░ ░ ░  ░`
       ░ ░  ░  ▒ ░░  ░  ░  ░         ▒ ░░░         ░ ░    ▒ ░   ░   ░ ░    ░   `
         ░     ░        ░  ░ ░       ░               ░  ░ ░           ░    ░  ░"

    $title = "You Are Dead!"
    $message = "Would you like to try again?"
    $choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Play Again", "&Quit")
    $userResponse = $host.ui.PromptForChoice($title, $message, $choices, 0)
    switch ($userResponse)
        {
            0 { Start-Game }
            1 { Quit }
        }
}

function CheckShuriken() {
    if ($global:shuriken -le 0) {
        Write-Host "You Lack Discipline! You are out of Shurikens." -ForegroundColor Red -BackgroundColor Black
        $global:haveShuriken=$false
    }
    else {
        $global:haveShuriken=$true
    }
}

function TakeDamage(){
    $damage = Get-Random -Maximum 30 -Minimum 6
        $damage = [Math]::Ceiling($damage / 5) * 5
        $global:health = ($global:health - $damage)
        Write-Host "You Lose $damage Health!" -ForegroundColor Yellow
        ChangeTitle
        if($global:health -le 0){
            Dead
        }
}

function Jump(){
    Write-Host ""
}

function Fight(){
    if($global:sword){
        do
        {
            $userResponse = Read-Host -Prompt "How do you want to fight? Answer (Throw Shuriken or Use Sword)"
        }
        while($userResponse -notlike "Shuriken" -and $userResponse -notlike "Sword")
       
        Write-Host ""

        Switch ($userResponse) 
        { 
            "Throw Shuriken" {Throw-Shuriken}
            "Use Sword" {Use-Sword}
        }
    }
    else {Throw-Shuriken}

}

function Fight-Skeleton() {

    if($global:haveShuriken) {
        Write-Host ""
        Write-Host "You turn to face your attacker. There is no talking your way out of this."
        Write-Host ""
        Sleep 1
        Write-Host "You can try to jump over the skeleton or try to kill it."
        Write-Host ""

        $message = "What will you do?"
        $choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Jump", "&Fight")
        $userResponse = $host.ui.PromptForChoice("Choose Wisely", $message, $choices, 1)
        switch ($userResponse)
            {
                0 { Jump }
                1 { Fight }
            }

        $battleRoll = Get-Random -Maximum 4 -Minimum 1
        if ($battleRoll -eq 1){
            Clear-Host
            Write-Host "Your shuriken hits the skeleton right in the face. It crumbles quickly to the floor."
        }
        elseif ($battleRoll -eq 2){
            Clear-Host
            Write-Host "Your shuriken hits the skeleton in the shoulder. It barely notices!"
            Write-Host "The skeleton reacts quickly. It swipes at you three times with its sword."
            Write-Host ""
            TakeDamage
            Fight-Skeleton
        }
        elseif ($battleRoll -eq 3){
            Clear-Host
            Write-Host "You completely missed! What a terrible throw!"
            Write-Host ""
            TakeDamage
            Fight-Skeleton
        }
    }else{
        Write-Host ""
        Jump
    }

}

function Fight-Troll() {
    Write-Host "You can try to ninja past the troll or try to kill it."
    Write-Host ""

    $message = "What will you do?"
    $choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Ninja", "&Fight")
    $userResponse = $host.ui.PromptForChoice("Choose Wisely", $message, $choices, 1)
    switch ($userResponse)
        {
            0 { 
                Write-Host "The troll smells your blood. He wraps his giant hand around your body and rips off both of your arms." -ForegroundColor Red -BackgroundColor Black
                Write-Host "Then he throws you to the ground and slowly presses down on your head with his foot until he feels that satisfying 'POP!'" -ForegroundColor Red -BackgroundColor Black
                Dead
            }
            1 { 
                Write-Host "Your shuriken stabs the troll right in the face. He looks pretty pissed." -ForegroundColor Red -BackgroundColor Black
                Write-Host "He throws you to the ground and slowly presses down on your head with his foot until he feels that satisfying 'POP!'" -ForegroundColor Red -BackgroundColor Black
                Dead
            }
        }
}

function Throw-Shuriken() {
    CheckShuriken
        if($global:haveShuriken){
        --$global:shuriken
        Write-Host 'You Threw A Shuriken!' -ForegroundColor Green
        Write-Host ""
        ChangeTitle
    }
}

function OpenChest() {
    # 0 = Health 1 = Shuriken
    $item = Get-Random -Maximum 2
    
    if ($item = 0){
        $numOfItem = Get-Random -Maximum 4 -Minimum 1
        $global:shuriken = ($global:shuriken + $numOfItem)
        if ($numOfItem = 1){
            Write-Host "You Got 1 Shuriken!" -ForegroundColor Yellow

        }else{
            Write-Host "You Got $numOfItem Shurikens!" -ForegroundColor Yellow
        }

    }else{
        $numOfItem = Get-Random -Maximum 50 -Minimum 6
        $numOfItem = [Math]::Ceiling($numOfItem / 5) * 5
        $global:health = ($global:health + $numOfItem)
        Write-Host "You Got $numOfItem Health!" -ForegroundColor Yellow
    }
    Write-Host ""
    ChangeTitle
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

Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host "`
             ▄████▄   ▄▄▄    ██▒   █▓▓█████     ███▄    █  ██▓ ███▄    █  ▄▄▄██▀▀▀▄▄▄      `
            ▒██▀ ▀█  ▒████▄ ▓██░   █▒▓█   ▀     ██ ▀█   █ ▓██▒ ██ ▀█   █    ▒██  ▒████▄    `
            ▒▓█    ▄ ▒██  ▀█▄▓██  █▒░▒███      ▓██  ▀█ ██▒▒██▒▓██  ▀█ ██▒   ░██  ▒██  ▀█▄  `
            ▒▓█▄ ▄██▒░██▄▄▄▄██▒██ █░░▒▓█  ▄    ▓██▒  ▐▌██▒░██░▓██▒  ▐▌██▒▓██▄██▓ ░██▄▄▄▄██ `
            ▒ ▓███▀ ░ ▓█   ▓██▒▒▀█░  ░▒████▒   ▒██░   ▓██░░██░▒██░   ▓██░ ▓███▒   ▓█   ▓██▒`
            ░ ░▒ ▒  ░ ▒▒   ▓▒█░░ ▐░  ░░ ▒░ ░   ░ ▒░   ▒ ▒ ░▓  ░ ▒░   ▒ ▒  ▒▓▒▒░   ▒▒   ▓▒█░`
              ░  ▒     ▒   ▒▒ ░░ ░░   ░ ░  ░   ░ ░░   ░ ▒░ ▒ ░░ ░░   ░ ▒░ ▒ ░▒░    ▒   ▒▒ ░`
            ░          ░   ▒     ░░     ░         ░   ░ ░  ▒ ░   ░   ░ ░  ░ ░ ░    ░   ▒   `
            ░ ░            ░  ░   ░     ░  ░            ░  ░           ░  ░   ░        ░  ░"

Write-Host ""
Write-Host "            Welcome Fellow 忍者 (Ninja)"
Write-Host ""

    $userResponse = Read-Host -Prompt "            Press Any Key to Play or Q to quit"
    if ($userResponse -like 'q'){
        Quit

    }else {
        Clear-Host
        LoadingBar 'Loading Your Adventure'
        
        Write-Host "`
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!`
        !                                                                                                            !`
        !                                         Your name is ワサビ (Wasabi)                                         !`
        !                         You have arrived at the ancient Cave of Fallen Shadows.                            !`
        !        The prophecy says that only one worthy ninja may enter this cave and obtain the Emerald Eye.        !`
        !                 You are not the first to attempt this feat. None, so far, have succeeded.                  !`
        !                                   You will almost certainly die.                                           !`
        !                                                                                                            !`
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!`
                                                                                                                      "

        Write-Host ""
        Write-Host ""
        $message = "Select Difficulty Level"
        $choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Easy", "&Normal", "&Hard", "&Ultimate Ninja")
        $userResponse = $host.ui.PromptForChoice("Difficulty", $message, $choices, 1)
        switch ($userResponse)
            {
                0 { 
                    [int]$global:health=150;
                    [int]$global:shuriken=10; 
                }
                1 { 
                    [int]$global:health=100;
                    [int]$global:shuriken=5; 
                }
                2 { 
                    [int]$global:health=75;
                    [int]$global:shuriken=3; 
                }
                3 { 
                    [int]$global:health=25;
                    [int]$global:shuriken=100; 
                }
            }
                                                                                                                        
        ChangeTitle

        Instructions
    }
}

function Instructions(){
    Write-Host "You enter the cave with $global:health health and $global:shuriken shurikens." -ForegroundColor Yellow
    Sleep 2
    Write-Host "You can find your current totals of each in the title bar at the top of this window." -ForegroundColor Yellow
    Sleep 3
    Write-Host "Any further instructions will be provided when, and only when, absolutely necessary." -ForegroundColor Yellow
    Sleep 2

    $userResponse = Read-Host -Prompt "Press Any Key to enter The Cave of Fallen Shadows or Q to quit"
    if ($userResponse -like 'q'){
        Quit

    }else {
        Clear-Host
        LoadingBar 'Entering The Cave of Fallen Shadows'
        Cave1
    }
}

function Cave1(){
    Write-Host ""
    Write-Host "You are immediately met by three beasts! Two skeletons, one on each side and a giant troll in the middle."
    Write-Host "They are super pissed and closing in on you. Take action, quickly!"
    Write-Host ""

    $message = "What will you do?"
    $choices = [System.Management.Automation.Host.ChoiceDescription[]] @("Go &Left", "Go &Straight", "Go &Right")
    $userResponse = $host.ui.PromptForChoice("Choose Wisely", $message, $choices, 1)
    switch ($userResponse)
        {
            0 { Fight-Skeleton }
            1 { Fight-Troll }
            2 { Fight-Skeleton }
        }

    if ($userResponse -eq 0 -or $userResponse -eq 2){
        Write-Host ""
        Write-Host "On The other side of the Skeleton's pile of bones you spy a small cave."
        Write-Host ""
        Write-Host "You quickly head toward it and disappear into the shadows. You have passed your first test."
        Write-Host ""
        
        $chestRoll = Get-Random -Maximum 3 -Minimum 1
            if($chestRoll -eq 1){
                Write-Host "As you explore your surroundings, you happen into an unlocked chest."
                Write-Host ""

                $message = "Will you open it?"
                $choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Of course! Open it!")
                $userResponse = $host.ui.PromptForChoice("Choose Wisely", $message, $choices, 0)
                switch ($userResponse)
                    {
                        0 { OpenChest }
                    }
            }else{
                Write-Host "This room is empty."
            }
            Write-Host ""

            $message = "Will you go farther into the cave or head back?"
            $choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Keep Going", "Go &Back")
            $userResponse = $host.ui.PromptForChoice("Choose Wisely", $message, $choices, 0)
            switch ($userResponse)
                {
                    0 {  }#keep going
                    1 {  }#goback
                }
    }
    elseif ($userResponse -eq 1){
        Write-Host ""
    }
}

Start-Game

