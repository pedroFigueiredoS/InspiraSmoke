*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URLlogin}    https://inspira.inspirali.com/
${CPF}    14146807085
${BirthDay}    01012000

*** Keywords ***
Abrir o navegador
    Open Browser    ${URLlogin}    Chrome
    Maximize Browser Window

Fechar navegador
    Close Browser

Login no Inspira
    Input Text    xpath=//input[@placeholder='CPF']    ${CPF}
    Input Text    xpath=//input[@placeholder='dd/mm/aaaa']    ${BirthDay}
    Click Button    css=.button-app--primary
    
Verificando componentes em tela
    Wait Until Element Is Visible    xpath=//button[@class='button-secondary'][contains(.,'Conhecer')]
    Element Should Be Visible    xpath=(//span[@class='text-btn desktop'][contains(.,'Realizar atividade')])[1]
    Element Should Be Visible    xpath=(//span[@class='text-btn desktop'][contains(.,'Realizar atividade')])[2]
    Element Should Be Visible    xpath=(//p[contains(.,'O Inspira é composto por atividades que te levam a ter contato com a jornada de aprendizagem do nosso ecossistema de ensino médico e de saúde.')])[1]
    Element Should Be Visible    xpath=//b[contains(.,'Fique atento aos prazos e confira abaixo todas as atividades:')]