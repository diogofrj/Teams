# Clona Meeting Policy

Este script PowerShell clona uma política de reunião do Microsoft Teams existente e aplica a nova política a usuários específicos.

## Funcionalidade

- Clona a política de reunião global do Microsoft Teams.
- Cria uma nova política com base na política global.
- Aplica a nova política a uma lista de usuários específicos.
- Define parâmetros personalizados para a nova política.

## Pré-requisitos

- PowerShell instalado.
- Módulo MicrosoftTeams instalado.
- Permissões adequadas para gerenciar políticas do Microsoft Teams.

## Como Utilizar

### Passo 1: Configurar o Ambiente

Certifique-se de que você está conectado ao Microsoft Teams PowerShell:

Execute o seguinte comando para instalar o PowerShellGet mais recente:

```powershell
    Install-Module -Name PowerShellGet -Force -AllowClobber
```

Instale o Módulo do PowerShell do Teams.

```powershell
    Install-Module -Name MicrosoftTeams -Force -AllowClobber
```

### Passo 2: Definir Variáveis

Edite o script para definir as variáveis de acordo com suas necessidades:

```powershell
$globalPolicy = Get-CsTeamsMeetingPolicy
$policyName = "NomeDaNovaPolítica"
$users = @("user1@domain.com", "user2@domain.com", "user3@domain.com")
```

### Passo 3: Executar o Script

Execute o script PowerShell:

```powershell
.\clona-policy.ps1
```

## Detalhes do Script

### Clonagem da Política Global

O script clona a política global do Microsoft Teams:

```powershell
$globalPolicy = Get-CsTeamsMeetingPolicy -Identity Global
```

### Criação da Nova Política

O script cria uma nova política com base na política global:
```powershell
New-CsTeamsMeetingPolicy -Identity $policyName -Description $policyDescription -AllowChannelMeetingScheduling $globalPolicy.AllowChannelMeetingScheduling
# ... outros parâmetros ...
-UsersCanAdmitFromLobby $globalPolicy.UsersCanAdmitFromLobby
```

### Aplicação da Política aos Usuários Específicos

Aplica a nova política aos usuários especificados:

```powershell
foreach ($usuario in $usuariosEspecificos) {
    Set-CsTeamsMeetingPolicy -Identity $usuario -PolicyName $policyName
}
```

### Definição de Parâmetros Personalizados

Define parâmetros personalizados para a nova política:

```powershell

Set-CsTeamsMeetingPolicy -Identity $policyName -AllowTranscription $AllowTranscription
```

### Passo 4: Verificar a Aplicação da Política  

Verifique se a nova política foi aplicada corretamente aos usuários especificados.

```powershell
(Get-CsUserPolicyAssignment -Identity "user1@domain.com").PolicyName
```
## Contribuição

Sinta-se à vontade para contribuir com melhorias para este script. Faça um fork do repositório, crie um branch para suas alterações e envie um pull request.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

Este `README.md` fornece uma visão geral detalhada do script, incluindo sua funcionalidade, pré-requisitos, instruções de uso e detalhes do script. Certifique-se de substituir as informações sensíveis e ajustar conforme necessário para o seu contexto específico.