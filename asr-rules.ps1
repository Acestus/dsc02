
$rules = @(
    "D4F940AB-401B-4EfC-AADC-AD5F3C50688A",  # Block executable content from email and webmail clients
    "01443614-CD74-433A-B99E-2ECDC07BFC25",  # Block executable files from running unless they meet a prevalence, age, or trusted list criterion
    "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2"   # Block credential stealing from LSASS
)

foreach ($rule in $rules) {
    Remove-MpPreference -AttackSurfaceReductionRules_Ids $rule -AttackSurfaceReductionRules_Actions Enabled
}


Get-MpPreference | Select-Object -ExpandProperty AttackSurfaceReductionRules_Ids