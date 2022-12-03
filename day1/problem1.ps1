$data = Get-Content -Path .\day1\data.txt
$list = New-Object System.Collections.Generic.List[int]
$calories = 0
foreach ($line in $data) {
    $string = $line.ToString()
    if (!($string -eq '')) {
        $calories += [int]$line
    }
    else {
        $list.Add($calories)
        $calories = 0
    }
}
$list = $list | Sort-Object -Descending

$total = $list[0] + $list[1] + $list[2]
$total