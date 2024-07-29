Get-Service -Name "AnyDesk" #-ComputerName "FITENERGIA-N01"
# Powershell é Orientado a objeto diferente do CMD

echo "Disco (comando get-disk): "
Get-Disk

$servico = Get-Service -Name "AnyDesk"
$servico.Status

if($servico.Status eq "Running") {
	$sertvico.Stop()
	$servico.Start()
} else {
	echo "Serviço não estava rodando!"
}


<# 
Command_Precedence -> ".\" to access files and scripts. 
Fizeram isso por segurança pois no cmd pessoas mal intencionadas faziam scripts com nomes
parecidos de comandos

Como exit
poderiam fazer script exitt com dois "T" para executar quando o usuarios digitar errado o comando "exit"
Assim, no PowerShell temos que usar o Command_Precedence
"get-help about_Command_Precedence"
#>


<# 
Ué mas o ping ww.google.com funciona sem Command Precedence. Por que?
O PING é um executavel que está dentro da pasta System32 do Windows
Ele funciona pois ele está em um diretorio que faz parte da variavel de ambiente PATH

Assim não precisa de Command_Precedence.
Se você tem um executavel ou um script que está em uma pasta que está dentro da variavel de ambiente PATH, você não precisa usar command precedence ".\"
#>

echo $env:path

$env:path

$env:path

#Todo PowerShell roda em cima do dotnet framework. Por isso, podemos usar comandos como GetType()

$env:path.GetType()

#Retorna como String, então podemos usar metodos de manipulação de String 

#Pesquise "msdn string" para ver a documentação da Microsoft

$env:path.Split(';') #Assim você quebra as linhas sempre que tiver o carcter ';'

Get-Member #É um metodo que visita o objeto e vai listar seus metodos e propriedades

$env:path | Get-Member # Retorna os metodos e propriedades do Objeto