Remove-Variable * -ErrorAction SilentlyContinue
$initialConfiguration = Get-Content -Path .\day5\data.txt -TotalCount 8
$columns = @(1..9 | ForEach-Object { New-Object System.Collections.ArrayList })

foreach ($line in $initialConfiguration) {
    $line = $line.ToCharArray()
    $positions = @(1, 5, 9, 13, 17, 21, 25, 29, 33)
    for ($i = 0; $i -lt $columns.Count; $i++) {
        $character = $line[$positions[$i]].ToString()
        if (![string]::IsNullOrWhiteSpace($character)) {
            $columns[$i].Add($character) | Out-Null
        }
    }
}

foreach ($column in $columns) {
    $column.Reverse()
}

$lineCount = Get-Content -Path .\day5\data.txt | Measure-Object -Line
$instructionLineCount = $lineCount.Lines - 9
$instructions = Get-Item -Path .\day5\data.txt | Get-Content -Tail $instructionLineCount

foreach ($instruction in $instructions) {
    $splitInstruction = $instruction.Split(" ")
    $amount = [int]$splitInstruction[1]
    $fromColumn = $columns[$splitInstruction[3] - 1]

    $toColumn = $columns[$splitInstruction[5] - 1]

    $startPosition = $fromColumn.Count - $amount
    $itemsToMove = $fromColumn.GetRange($startPosition, $amount)

    $toColumn.AddRange($itemsToMove)

    $fromColumn.RemoveRange($startPosition, $amount)
}
$topItems = ""
foreach ($column in $columns) {
    $topItems += $column[$column.Count - 1]
}

$topItems