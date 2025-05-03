$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'lib'),
    ($nu.config-path | path dirname | path join 'lib/config'),
    ($nu.config-path | path dirname | path join 'lib/commands'),
    ($nu.config-path | path dirname | path join 'lib/completions'),
    ($nu.config-path | path dirname | path join 'lib/themes'),
]
