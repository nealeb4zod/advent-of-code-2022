$assignments = Get-Content -Path .\day4\data.txt

$fullyContainedAssignments = 0

foreach ($assignment in $assignments) {
    $assignment = $assignment.ToString().Split(",")
    $assignmentOne = $assignment[0].ToString().Split('-')
    $assignmentTwo = $assignment[1].ToString().Split('-')

    $assignmentOne = @($assignmentOne[0]..$assignmentOne[1])
    $assignmentTwo = @($assignmentTwo[0]..$assignmentTwo[1])

    foreach ($area in $assignmentOne) {
        if (!$assignmentTwo.Contains($area)) {
            $fullyContained = $false
            break
        }
        $fullyContained = $true
    }
    if ($fullyContained) {
        $fullyContainedAssignments ++
    }
    else {
        $fullyContained = $false
        foreach ($area in $assignmentTwo) {
            if (!$assignmentOne.Contains($area)) {
                $fullyContained = $false
                break
            }
            $fullyContained = $true
        }
        if ($fullyContained) {
            $fullyContainedAssignments ++
        }
    }
}

$fullyContainedAssignments