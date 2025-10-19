Describe "Disk Test"{
  It "Correct"{
      $result =./FindDisk.ps1
      $result |Should -Not -BeNullOrEmpty
    }
}
