$assignments = Get-Content -Path .\day4\data.txt

$overlappingAssignments = 0

foreach ($assignment in $assignments) {
    $assignment = $assignment.ToString().Split(",")
    $assignmentOne = $assignment[0].ToString().Split('-')
    $assignmentTwo = $assignment[1].ToString().Split('-')

    $assignmentOne = @($assignmentOne[0]..$assignmentOne[1])
    $assignmentTwo = @($assignmentTwo[0]..$assignmentTwo[1])

    $overlapping = $false

    foreach ($area in $assignmentOne) {
        if ($assignmentTwo.Contains($area)) {
            $overlapping = $true
            break
        }
    }
    if ($overlapping) {
        $overlappingAssignments ++
    }
    else {
        $overlapping = $false
        foreach ($area in $assignmentTwo) {
            if ($assignmentOne.Contains($area)) {
                $overlapping = $true
                break
            }
        }
        if ($overlapping) {
            $overlappingAssignments ++
        }
    }
}

$overlappingAssignments