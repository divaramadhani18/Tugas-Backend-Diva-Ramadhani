<?php
function tentukanGrade($nilai)
{
    if ($nilai >=85) {
        $grade= "A";
    } elseif ($nilai >=70) {
        $grade= "B";
    } elseif ($nilai >=55) {
        $grade= "C";
    } elseif ($nilai >=40) {
        $grade= "D";
    } else {
        $grade= "E";
    }
    return $grade;
}

$dataMahasiswa = [
    ["nama" => "Diva", "nilai" => 92],
    ["nama" => "Abi", "nilai" => 78],
    ["nama" => "Hanin", "nilai" => 65],
    ["nama" => "Syirin", "nilai" => 88],
    ["nama" => "Ami", "nilai" => 49],
    ["nama" => "Syahla", "nilai" => 71],
    ["nama" => "Qila", "nilai" => 30]
];

echo "Grading Nilai Mahasiswa <br><br>";

foreach ($dataMahasiswa as $mhs) {
    $grade = tentukanGrade($mhs["nilai"]);

    echo $mhs["nama"] . " | Nilai: " . $mhs["nilai"] . " | Grade: " . $grade . "<br>";
}
?>