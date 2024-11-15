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
            Maximum_Password_Age                        = 42
            Minimum_Password_Age                        = 1
            Minimum_Password_Length                     = 12
            Password_must_meet_complexity_requirements  = 'Enabled'
            Store_passwords_using_reversible_encryption = 'Disabled'
        }
    }
}