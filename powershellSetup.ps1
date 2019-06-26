
Get-Content ~\tools\config\profile > $profile

function global:commit {
    git add .
    git commit -m $args[0]
    git push
}

function global:kubecurl {
    kubectl run -it --rm curl --restart=Never --image=nbrown/curl -- $args[0]
    Write-Output ""
}
