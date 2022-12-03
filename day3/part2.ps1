$listOfRucksacks = Get-Content -Path .\day3\data.txt
$alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$totalPriorities = 0

$numberOfGroups = $listOfRucksacks.Count / 3

$rucksackIndex = 0
for ($i = 0; $i -lt $numberOfGroups; $i++) {
    $rucksackOne = $listOfRucksacks[$rucksackIndex].ToCharArray() | Select-Object -Unique
    $rucksackIndex ++
    $rucksackTwo = $listOfRucksacks[$rucksackIndex].ToCharArray() | Select-Object -Unique
    $rucksackIndex ++
    $rucksackThree = $listOfRucksacks[$rucksackIndex].ToCharArray() | Select-Object -Unique
    $rucksackIndex ++

    foreach ($item in $rucksackOne) {
        if ($rucksackTwo.Contains($item)) {
            if ($rucksackThree.Contains($item)) {
                $priority = 0
                $priority = $alphabet.IndexOf($item) + 1
                $totalPriorities += $priority
            }
        }
    }
}


$totalPriorities