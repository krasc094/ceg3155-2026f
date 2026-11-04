param([string[]]$Testbenches)

$flags = @('-fsynopsys')

if (-not $Testbenches) {
  $Testbenches = @(
    'tb_adder4', 'tb_comparator4', 'tb_counter4', 'tb_hex_bcd_decoder',
    'tb_sevenSeg', 'tb_trafficLightController'
  )
}

Remove-Item work-obj*.cf -ErrorAction SilentlyContinue
$files = (Get-ChildItem given\*.vhdl, mine\*.vhdl, testbench\*.vhdl).FullName
ghdl -i @flags @files
if ($LASTEXITCODE -ne 0) { Write-Host '!! Import failed'; exit 1 }

foreach ($tb in $Testbenches) {
  Write-Host ''
  Write-Host "================ $tb ================"
  ghdl -m @flags $tb
  if ($LASTEXITCODE -ne 0) { Write-Host "!! $tb did not compile"; continue }
  # every testbench stops on its own; the stop time is only a safety limit
  ghdl -r @flags $tb "--wave=$($tb).ghw" '--stop-time=1ms'
  if ($LASTEXITCODE -ne 0) { Write-Host "!! $tb stopped with an error" }
}

Write-Host ''
Write-Host 'Done. Open a waveform with: gtkwave <testbench>.ghw'
