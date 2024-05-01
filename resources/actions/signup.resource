*** Settings ***
Documentation    Acoes, steps e elementos da funcionalidade de cadastro

Library    Browser

*** Keywords ***
GO TO signup page    #palavra chave customizada (agrupamento)
    Click    css=a[href="/signup"]

    ## Wait For Elements State    selector=form h1    state=visible    timeout=5000
    Wait For Elements State   form h1    visible    5000    
    ## Get Text seletor=texto no inspecionar / condicao / texto a ser procurado
    Get Text   h1  equal   Faça seu cadastro

FILL signup form    #palavra chave customizada (agrupamento)
    [Arguments]    ${dog_walker}
    Fill Text    css=input[name=name]              ${dog_walker}[name]
    Fill Text    css=input[name=email]             ${dog_walker}[email]
    Fill Text    css=input[name=cpf]               ${dog_walker}[cpf]
    Fill Text    css=input[name=cep]               ${dog_walker}[cep]

    Click    css=input[type=button][value$=CEP]

    Get Property    css=input[name=addressStreet]    value    equal   ${dog_walker}[street]     #VALIDAR em relação ao declarado na massa de teste
    Get Property    css=input[name=addressDistrict]  value    equal   ${dog_walker}[district]
    Get Property    css=input[name=addressCityUf]    value    equal   ${dog_walker}[city_uf]

    Fill Text    css=input[name=addressNumber]     ${dog_walker}[number]
    Fill Text    css=input[name=addressDetails]    ${dog_walker}[details]

    Upload File By Selector    css=input[type=file]    ${EXECDIR}/resources/fixtures/${dog_walker}[cnh]    ## Busca a imagen no diretorio raiz do teste

SUBMIT signup form    #palavra chave customizada (agrupamento)
    Click    css=.button-register    ## clicar no botao "Cadastrar"

POPUP shoul be    #palavra chave customizada (agrupamento)
    ## COMANDOS IMPORTANTES ##  
    [Arguments]        ${expected_text}   
    Wait For Elements State    css=.swal2-html-container    visible    5        ## Verifica se o elemento ficara visivel em ate 5s
    Get Text                   css=.swal2-html-container    equal    ${expected_text}    ## pega o texto do elemento e compara se é igual com o resultado esperado (determinado no Test Cases no agrupamento POPUP shoul be)

Alert Shold Be
    [Arguments]        ${expected_text}

        Wait For Elements State    css=.alert-error >> text=${expected_text}



