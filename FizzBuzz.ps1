param(
[int]$max = 30
)
$tab = @()
for($i = 1;$i -le $max;$i++){
  if($i % 5 -eq 0 -and $i % 3 -eq 0){
    $tab += "FizzBuzz"
    }
  elseif($i % 3 -eq 0){
    $tab += "Fizz"
    }
   elseif($i % 5 -eq 0){
    $tab += "Buzz"
    }
    else{
      $tab += $i
      }
  }
return $tab
    
