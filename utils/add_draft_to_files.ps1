

# Write-Output "Hello, World世界!"

if($args.length -ge 1){
    $path = $args[0]
}else {
    $path = "./content/docs/日记"    
}

try {
    if(Test-Path -Path $path -PathType Container){
        Write-Output "Path $path is a directory"
    }elseif(Test-Path -Path $path -PathType Leaf){
        Write-Output "Path $path is a file"
    }else{
        throw "Invalid path: $path"
    }
}catch{
    Write-Error $_.Exception.Message
}

$files = Get-ChildItem -Path $path -Filter "*.md" -Recurse

foreach ($file in $files) {
    $fileContent = Get-Content -Path $file.FullName
    $newLint = "draft : true"
    $fileContent = $fileContent[0], $newLine + $fileContent[1..($fileContent.Length - 1)]

    Set-Content -Path $file.FullName -Value $fileContent
    Write-Output "Set draft to false for file $file"
}
