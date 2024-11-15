Install-Module -Name SecurityPolicyDsc -Force

#Requires -Module SecurityPolicyDsc


<#
    .DESCRIPTION
        This configuration will manage the local security account policy.
#>

Configuration AccountPolicy_Config
{
    Import-DscResource -ModuleName SecurityPolicyDsc

    node localhost
    {
        AccountPolicy 'AccountPolicies'
        {
            Name                                        = 'PasswordPolicies'
            Enforce_password_history                    = 15
            Maximum_Password_Age                        = 100
            Minimum_Password_Age                        = 1
            Minimum_Password_Length                     = 12
            Password_must_meet_complexity_requirements  = 'Enabled'
            Store_passwords_using_reversible_encryption = 'Disabled'
        }
    }
}

AccountPolicy_Config -OutputPath "C:\DSC\SetLocalPasswordMaxAge"
Start-DscConfiguration -Path "C:\DSC\SetLocalPasswordMaxAge" -Wait -Verbose -Force

net accounts