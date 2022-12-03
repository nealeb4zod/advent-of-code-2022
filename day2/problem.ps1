$data = Get-Content -Path .\day2\data.txt
Clear-Variable -Name shapes
Clear-Variable -Name villainShape
Clear-Variable -Name result
Clear-Variable -Name score
Clear-Variable -Name heroShape

$totalScore = 0

foreach ($line in $data) {
    Clear-Variable -Name shapes
    Clear-Variable -Name villainShape
    Clear-Variable -Name heroShape
    Clear-Variable -Name result
    Clear-Variable -Name score

    $shapes = $line.Split()
    $villainShape = $shapes[0]
    $heroShape = $shapes[1]

    switch ($villainShape.ToLower()) {
        "a" { $villainShape = "r" }
        "b" { $villainShape = "p" }
        "c" { $villainShape = "s" }
    }

    switch ($heroShape.ToLower()) {
        "x" { $heroShape = "r" }
        "y" { $heroShape = "p" }
        "z" { $heroShape = "s" }
    }

    $winLookup = @{
        "r" = "s"
        "p" = "r"
        "s" = "p"
    }

    $result = ""
    if ($winLookup[$heroShape] -eq $villainShape) {
        $result = "w"
    }
    elseIf ($winLookup[$villainShape] -eq $heroShape) {
        $result = "l"
    }
    else {
        $result = "d"
    }

    $score = 0

    switch ( $result.ToLower() ) {
        "w" { $score += 6 }
        "d" { $score += 3 }
    }

    switch ( $heroShape.ToLower() ) {
        "r" { $score += 1 }
        "p" { $score += 2 }
        "s" { $score += 3 }
    }

    # $result = Get-Result($villainShape, $heroShape)
    # $score = Get-Score($result, $heroShape)
    $totalScore += $score
}
$totalScore