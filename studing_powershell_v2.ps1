<# SHA é um algoritmo de Hash, ele pega um arquivo de N gigabytes e transforma em uma chave de 1, 256,384,512. Com ele ´você pode comparar para ver se dois arquivos são iguais, evitando interceptação ou ataques onde alguém substitui um arquivo de atualização, script etc.

Além de saber se o arquivo foi alterado por um hacker, da pra ver se o arquivo foi corrompido comparando o HASh antigo com o novo

#>

<# CD e DIR são apelidos (alias) de comandos do PowerShell
Podemos verificar qual o comando desse apelido usando Get-Alias -Name dir por ex
#>

Get-Alias -Name dir

#Retorno: dir -> Get-ChildItem

<#
Padrão de comandos do PowerShell é Verb-Noun
Verb-Noun = Verbo-Substantivo
convenção de nomes do powershell Verbo-Nome “Get-Disk”
É bem intuitivo
#>


#Vamos criar um arquivo em PowerShell

$arquivo = ".\novo-arquivo.txt"

New-Item -Path $arquivo -ItemType File #cria o arquivo no diretorio declarado na variavel $arquivo
Add-Content -Path $arquivo -Value "This is some more text." #Adiciona conteudo no arquivo

#Para verificar os comandos do PowerShell podemos usar o comando:
Get-Command

#Podemos passar um argumento para filtrar
Get-Command -Name *rename*


#Podemos filtrar pelo verbo, ou pelo substantivo
Get-Command -Verb *rename*
Get-Command -Noun *Item*

#Podemos buscar ajuda para o comando
Get-Help -Name rename-item

#Retorna o Nome, Sintaxe, Aliases e Comentarios do comando especificado

#Para atualizar e baixar os arquivos de ajuda usamos o comando Update-Help
Update-Help

<# WhatIf é um argumento do tipo switch. Switch argument não precisa de valor, quando presente ele muda o comportamento do comando

-WhatIf não executa, ele diz o que o comando faria

#>

Rename-Item novo-arquivo.txt arquivo-renomeado.txt -WhatIf

#Vamos renomear nosso arquivo agora

Rename-Item novo-arquivo.txt arquivo-renomeado.txt

#Vamos criar um Alias para o comando do Rename-Item

Get-Command -noun alias #Vamos achar o comando
Get-Help New-Alias
Get-Help New-Alias -examples # Me da exemplos de execução do comando

New-Alias -name "rename" rename-item
Get-Alias -name rename

rename arquivo-renomeado.txt arquivo-renomeado-novamente.txt

<#
Ao fechar e abrir novamente o PowerShell você perde os Alias criado.
Para salvar seus Alias você deve criar um profile (perfil)

Profiles são scripts que rodam sempre ao abrir o PowerShell.
O comando $profile mostra o caminho do seu profile
#>

$profile

# Me retorna o profile padrão do PowerShell "Microsoft.PowerShell_profile.ps1"
#Se vc não tiver o profile criado, apenas execute um new-item para cria-lo

New-Item $profile

#Cria nosso Profile na diretorio informnado no $profile

<#
Vamos ver se seu powershell tem a execução de script habilitada, se não seu profile não vai rodar
#>

Get-Help about_execution_policies

Get-ExecutionPolicy

#Retorna sua politica de execução, vamos usar Unrestricted para rodar os scripts

Set-ExecutionPolicy Unrestricted

Set-ExecutionPolicy Restricted # Para voltar para restrito



Get-Help about_profiles
<#
Nós criamos um profile para o current user.

-   Current User, Current Host - $PROFILE
-   Current User, Current Host - $PROFILE.CurrentUserCurrentHost
-   Current User, All Hosts - $PROFILE.CurrentUserAllHosts
-   All Users, Current Host - $PROFILE.AllUsersCurrentHost
-   All Users, All Hosts - $PROFILE.AllUsersAllHosts

Para criar um Profile na máquina ou no servidor, ao invés do Usuario atual, usamos:
new-item $PROFILE.AllUsersAllHosts

Cuidado pois não podemos criar alias com mesmo nome em um profile de user e um profile de alluser ao mesmo tempo.
#>

Get-Host
hostname #nome da Máquina