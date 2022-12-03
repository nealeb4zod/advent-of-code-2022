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
    $desiredResult = ""
    switch ($shapes[1].ToLower()) {
        "x" { $desiredResult = "l" }
        "y" { $desiredResult = "d" }
        "z" { $desiredResult = "w" }
    }

    switch ($villainShape.ToLower()) {
        "a" { $villainShape = "r" }
        "b" { $villainShape = "p" }
        "c" { $villainShape = "s" }
    }

    $loseLookup = @{
        "s" = "r"
        "r" = "p"
        "p" = "s"
    }

    $winLookup = @{
        "r" = "s"
        "p" = "r"
        "s" = "p"
    }

    # $heroShape = $shapes[1]
    switch ($desiredResult) {
        "w" { $heroShape = $loseLookup[$villainShape] }
        "l" { $heroShape = $winLookup[$villainShape] }
        "d" { $heroShape = $villainShape }
    }

    $score = 0

    switch ( $desiredResult.ToLower() ) {
        "w" { $score += 6 }
        "d" { $score += 3 }
    }

    switch ( $heroShape.ToLower() ) {
        "r" { $score += 1 }
        "p" { $score += 2 }
        "s" { $score += 3 }
    }

    $totalScore += $score
}
$totalScore