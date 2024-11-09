*** Settings ***
Resource    inspira_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Caso de teste 01 - Login Inspira (Candidato Comum)
    [Documentation]    Esse teste tem como objetivo fazer login com um usuário comum
    [Tags]    Login
    Login no Inspira
    Verificando componentes em tela
