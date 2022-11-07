
Write-Host "Generating Exit Code"


# exit successfully
exit 0

# exit failure
exit 1

# exit failure
throw 'Some Error'

# handle exception
try {
  Write-Host $env:SOME_ENV_VAR
  Write-Host 'Throw Some Error'
  throw 'Some Error'
}
catch {
  Write-Host "Catch Exception"
  Write-Host $_
  # exit 1
}
finally {
  Write-Host "Finally"
}
