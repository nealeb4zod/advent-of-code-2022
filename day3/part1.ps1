$listOfRucksacks = Get-Content -Path .\day3\data.txt
$alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$totalPriorities = 0

foreach ($rucksack in $listOfRucksacks) {
    $rucksack = $rucksack.ToString()
    $countOfItems = $rucksack.Length
    $compartmentMaxItems = $countOfItems / 2
    $compartmentOneItems = $rucksack.Substring(0, $compartmentMaxItems)
    $compartmentTwoItems = $rucksack.Substring($compartmentMaxItems, $compartmentMaxItems)
    $uniqueCompartMentOneItems = $compartmentOneItems.ToCharArray() | Select-Object -Unique
    foreach ($item in $uniqueCompartMentOneItems) {
        if ($compartmentTwoItems.ToCharArray().Contains($item)) {
            $priority = 0
            $priority = $alphabet.IndexOf($item) + 1
            $totalPriorities += $priority
        }
    }
}

$totalPriorities
