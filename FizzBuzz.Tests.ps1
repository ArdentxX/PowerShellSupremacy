param(
[int]$inputValue =15)
Describe "FizzTest"{
	beforeAll{
		$result = ./FizzBuzz.ps1 -max $inputValue	
	}
	for($i = 1;$i -le $inputValue;$i++){
		It "FizzBuzz is working correctly fo $i"{
		if($i % 5 -eq 0 -and $i % 3 -eq 0){
				$result[$i-1] | Should -Be "FizzBuzz"}
		elseif($i % 3 -eq 0){
				$result[$i-1] | Should -Be "Fizz"}
		elseif($i % 5 -eq 0){
				$result[$i-1] | Should -Be "Buzz"}
		else{
				$result[$i-1] | Should -Be $i}
		}
	}	
}
