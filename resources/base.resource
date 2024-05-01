*** Settings ***
Documentation    Arquivo principal do projeto

Library    Browser    

Resource    env.resource    #nao precisa especificar a pasta pois esta na mesma linha do base.resource
Resource    actions/signup.resource

*** Keywords ***
Start session
# Para especificar QUAL O NAVEGADOR a ser usado no teste: usar a linha de comando no Windows terminal
# robot -d ./logs/ -v BROWSER:firefox tests/signup.robot (para rodar no chromium...não usar o -v BROWSER:firefox)
    New Browser    browser=${BROWSER}    headless=True    # headless=true - não abre o navegador headless=false abre o navegador
    New Page    https://walkdog.vercel.app

    Wait For Elements State    css=h1 >> text=Cuidado e diversão em cada passo  
    ...    visible    5 

Finish session
    Take Screenshot    fullPage=True