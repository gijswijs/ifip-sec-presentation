param ($wsf, $template, $H, $o, $csl, $bibliography)

$Dir = Get-ChildItem -Path "$wsf/source/".replace("\","/")
 
$List = $Dir | Where-Object {$_.extension -eq ".md"}| ForEach-Object {$_.FullName} 
$List = $([string]$List).replace("\","/")
Write-Host($List)
$Command = -join
(
"pandoc $List ",
"--template=`"$template`" ",
"-H `"$H`" ",
"-F pandoc-crossref ",
"-o `"$o`" ",
"--csl=`"$csl`" ",
"--highlight-style pygments ",
"--lua-filter=`"C:/Repositories/ivic-proceedings/style/git-revision.lua`" ",
# "--lua-filter=`"C:/Repositories/ivic-proceedings/style/metadata-replace.lua`" ",
"--bibliography=`"$bibliography`" ",
"-V fontsize=12pt ",
"-V papersize=a4paper "
)
Invoke-Expression $Command