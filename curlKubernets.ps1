
# param (
#     [Parameter(mandatory=$true)][Alias("curlTarget")]
#     [string]$target
# )

kubectl run -it --rm curl --restart=Never --image=nbrown/curl -- $args[0]
Write-Output ""
