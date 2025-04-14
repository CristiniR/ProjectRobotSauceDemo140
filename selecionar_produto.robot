*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    Firefox

*** Test Cases ***

Selecionar Sauce Labs Backpack
    Dado que acesso o site SauceDemo
    Quando preencho o usuario    standard_user
    E preencho a senha    secret_sauce
    E clico no botao login
    Entao sou direcionado para a pagina de produtos
    Quando clico no produto    Sauce Labs Backpack    $29.99
    Entao sou direcionado para a pagina do produto
    Quando clico em adicionar no o carrinho
    Entao vizualizo o numero de itens no carrinho    1
    Quando clico no icone do carrinho
    Entao sou direcionado para pagina do carrinho
    Quando clico no menu burguer
    E clico em logout
    Então sou direcionado para a pagina de login

Selecionar Sauce Labs Backpack Login com Enter
    Dado que acesso o site SauceDemo
    Quando preencho o usuario    standard_user
    E preencho a senha    laranja
    E pressiono a tecla Enter

*** Keywords ***
Dado que acesso o site SauceDemo
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    10000ms
    Wait Until Element Is Visible    css=.login_logo    5000ms

Quando preencho o usuario
    [Arguments]    ${username}
    Input Text    css=[data-test="username"]    ${username}    

E preencho a senha
    [Arguments]    ${password}
    Input Password    css=[data-test="password"]    ${password}

E clico no botao login
    Click Button    id=login-button

E pressiono a tecla Enter
    Press Key    css=[data-test="password"]    ENTER

Entao sou direcionado para a pagina de produtos
    Element Text Should Be    css=[data-test="title"]    Products

Quando clico no produto
    [Arguments]    ${product_name}    ${product_price}
    Set Test Variable    ${test_product_name}    ${product_name}
    Set Test Variable    ${test_product_price}    ${product_price}
    Click Element    css=img[alt="${test_product_name}"]

Entao sou direcionado para a pagina do produto
    Element Text Should Be    name=back-to-products    Back to products
    Element Text Should Be    css=div.inventory_details_name.large_size    ${test_product_name}
    Element Text Should Be    css=div.inventory_details_price    ${test_product_price}

Quando clico em adicionar no o carrinho
    Click Element    id=add-to-cart

Entao vizualizo o numero de itens no carrinho
    [Arguments]    ${cart_items}
    Set Test Variable    ${test_cart_items}    ${cart_items}
    Element Text Should Be    css=span.shopping_cart_badge   ${test_cart_items}

Quando clico no icone do carrinho
    Click Link    ${test_cart_items}


Entao sou direcionado para pagina do carrinho
    Wait Until Element Contains    css=.title    Your Cart
    Element Text Should Be    css=div.inventory_item_name    ${test_product_name}
    Element Text Should Be    css=div.inventory_item_price    ${test_product_price}
    Element Text Should Be    css=div.cart_quantity    ${test_cart_items}

Quando clico no menu burguer
    Click Element    id=react-burger-menu-btn

E clico em logout
    Click Element    id=logout_sidebar_link

Então sou direcionado para a pagina de login
    Wait Until Element Is Visible    id=login-button    5000ms

    


   
    

    
    

 








