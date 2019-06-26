
Get-Content ~\tools\config\profile > $profile

function global:commit {
    git add .
    git commit -m $args[0]
    git push
}
