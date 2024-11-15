Configuration SetLocalPasswordMaxAge {
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

    Node 'localhost' {
        Script SetMaxPasswordAge {
            GetScript = {
                @{
                    GetScript = $null
                    TestScript = { return $true }
                    SetScript = {
                        net accounts /maxpwage:181
                    }
                }
            }
            TestScript = {
                $output = net accounts
                $output -match "Maximum password age (.*): 181 days"
            }
            SetScript = {
                net accounts /maxpwage:181
            }
        }
    }
}

# Apply the configuration
SetLocalPasswordMaxAge -OutputPath "C:\DSC\SetLocalPasswordMaxAge"
Start-DscConfiguration -Path "C:\DSC\SetLocalPasswordMaxAge" -Wait -Verbose