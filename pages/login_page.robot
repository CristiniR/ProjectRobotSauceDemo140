*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${txt_usuario}    css=[data-test="username"]
${txt_senha}    css=[data-test="password"]
${btn_login}    id=login-button

*** Keywords ***
Preencher usuario
    [Arguments]    ${usuario}
    Input Text    ${txt_usuario}    ${usuario}

Preencher senha
    [Arguments]    ${senha}
    Input password    ${txt_senha}    ${senha}

Clicar no botao login 
    Click Button    ${btn_login}
