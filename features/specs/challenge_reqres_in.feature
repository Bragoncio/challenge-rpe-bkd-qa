#language: pt
#utf-8

@make_all_tests
Funcionalidade: Fluxo completo do challenge reqres in
  Eu como participante a ser avaliado
  Quero cadastrar e validar as informações dos usuarios via api reqres in


  Critérios de aceitação:
  Todas as informações inseridas precisam ser registradas exatamente como foram submetidas.
  Cada vez que o processo for realizado, deve apresentar um código de retorno que esteja em conformidade com a massa de testes especificada
  Os contratos que regem os Endpoints devem ser mantidos de maneira consistente.
  Registrar em logs as execuções para posterior análise

  Contexto:
    Dado que eu tenha acesso à API Reqres In

  ##################################################################################################
  #   POST Create Users                                                                            #
  ##################################################################################################

  @post_create_users
  Cenario: Realizar uma requisição POST para criação de pessoa na plataforma Regres In
    E possuo um payload valido para criação de pessoa
    Quando forneço as informações de acordo com o formato requerido pelo serviço de criação de pessoa.
    Então deve se ter a confirmação do cadastro de pessoa física
    E o retorno da requisição deve seguir o contrato JSON esperado