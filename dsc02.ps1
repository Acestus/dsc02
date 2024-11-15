Configuration SetPasswordMaxAge {
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

    Node 'localhost' {
        User AccountPolicy {
            MaximumPasswordAge = 181
        }
    }
}

# Apply the configuration
SetPasswordMaxAge -OutputPath "C:\DSC\SetPasswordMaxAge"
Start-DscConfiguration -Path "C:\DSC\SetPasswordMaxAge" -Wait -Verbose