*** Settings ***
Documentation       Suite de teste de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup       Start session    #ver base.resource - comando para iniciar o teste em cada caso assim não há a necessidade de escrever essa keyword em cada caso
Test Teardown    Finish session    

*** Test Cases ***
Deve poder cadstrar um novo dog walker

    ${dog_walker}    Create Dictionary
    ...    name=RUFO ARQUITETURA
    ...    email=rufoitretura-1082@yopmail.com
    ...    cpf=32584222060
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    number=1000
    ...    details=Apto 22
    ...    cnh=toretto.jpg    


    GO TO signup page    #ver signup.resource
    FILL signup form    ${dog_walker}    #ver signup.resource
    SUBMIT signup form    #ver signup.resource
    POPUP shoul be    Recebemos o seu cadastro e em breve retornaremos o contato.    #ver signup.resource
  


Nao deve cadastrar se o CPF for incorreto
    [Tags]    cpf_inv

    ${dog_walker}    Create Dictionary
    ...    name=RUFO ARQUITETURA
    ...    email=rufoitretura-1082@yopmail.com
    ...    cpf=32584222060aa
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    number=1000
    ...    details=Apto 22
    ...    cnh=toretto.jpg    


    GO TO signup page    #ver signup.resource
    FILL signup form    ${dog_walker}    #ver signup.resource
    SUBMIT signup form    #ver signup.resource
    Alert Shold Be    CPF inválido
  

Nao deve cadastrar se os campos obrigatorios nao forem preenchidos
    [Tags]    required

    #${dog_walker}    Create Dictionary
    #...    name=RUFO ARQUITETURA
    #...    email=rufoitretura-1082@yopmail.com
    #...    cpf=32584222060
    #...    cep=04534011
    #...    street=Rua Joaquim Floriano
    #...    district=Itaim Bibi
    #...    city_uf=São Paulo/SP
    #...    number=1000
    #...    details=Apto 22
    #...    cnh=toretto.jpg    


    GO TO signup page    #ver signup.resource
    #FILL signup form    ${dog_walker}    #ver signup.resource
    SUBMIT signup form    #ver signup.resource
    Alert Shold Be    Informe o seu nome completo
    Alert Shold Be    Informe o seu melhor email
    Alert Shold Be    Informe o seu CPF
    Alert Shold Be    Informe o seu CEP
    Alert Shold Be    Informe um número maior que zero
    Alert Shold Be    Adcione um documento com foto (RG ou CHN)

  









