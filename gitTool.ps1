param (
    [Parameter(Mandatory=$true)][string]$commitMessage
)
git add .
git commit -m $commitMessage
git push
