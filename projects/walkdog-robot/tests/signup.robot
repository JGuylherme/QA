*** Settings ***
Documentation       Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup    Start Session
Test Teardown    Finish Session

*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]    smoke
    ${dog_walker}        Create Dictionary
    ...    name=José Silva
    ...    email=email@email.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=DriversLicense.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required
    Go to signup page
    Submit signup form

    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)

Não deve cadastrar um novo dog walker
    [Tags]    cpf_inv
    ${dog_walker}        Create Dictionary
    ...    name=José Silva
    ...    email=email@email.com
    ...    cpf=000000141aa
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=DriversLicense.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Alert should be    CPF inválido

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]    aservice
    ${dog_walker}        Create Dictionary
    ...    name=Ana Maria Braga
    ...    email=gmail@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=DriversLicense.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Cuidar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walker que sabe adestrar pets
    [Tags]    aservice
    ${dog_walker}        Create Dictionary
    ...    name=Carlota Silvia
    ...    email=carlota@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=DriversLicense.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Adestrar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.
