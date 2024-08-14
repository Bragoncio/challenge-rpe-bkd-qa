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

  @post_register_users
  Cenario: Realizar uma requisição POST para registro de usuarios na plataforma Regres In
    E possuo um payload valido para registro de usuario
    Quando forneço as informações de acordo com o formato requerido pelo serviço de criação dos usuarios.
    Então deve se ter a confirmação do usuario da pessoa cadastrado no sistema
    E o retorno da requisição deve seguir o contrato JSON esperado


    Esquema do Cenário: Validar o registro de usuario somente alguns objetos preenchidos
      E que o campo "<field>" não esteja preenchido no payload de registro
      Quando forneço as informações de acordo com o formato requerido pelo serviço de criação dos usuarios.
      Então o sistema não prossegue com a solicitação retornando a mensagem de error "<message_error>" e o status <code>
      E o retorno da requisição deve seguir o contrato JSON esperado

      Exemplos:
        | field    | code|       message_error       |
        | email    | 400  | Missing email or username |
        | password | 400  | Missing password          |

  ##################################################################################################
  #   GET Users                                                                            #
  ##################################################################################################
  @get_user_by_id
  Cenario: Realizar uma requisição GET para consultar um usuário por ID na plataforma Regres In
    E possuo um payload valido para registro de usuario
    E forneço as informações de acordo com o formato requerido pelo serviço de criação dos usuarios.
    E deve se ter a confirmação do usuario da pessoa cadastrado no sistema
    E que eu possuo um ID válido de um usuário cadastrado
    Quando eu realizo uma requisição GET com o ID do usuário
    Então deve-se retornar as informações do usuário correspondente
    E o retorno da requisição deve seguir o contrato JSON esperado


  ##################################################################################################
  #   Put Users                                                                            #
  ##################################################################################################

  @put_update_user_by_id
  Cenario: Realizar uma requisição PUT para atualizar um usuário por ID na plataforma Regres In
    E possuo um payload valido para criação de pessoa
    E forneço as informações de acordo com o formato requerido pelo serviço de criação de pessoa.
    E deve se ter a confirmação do cadastro de pessoa física
    E que eu possuo um ID válido de um usuário
    E que possua um payload para atualização do usuario
    Quando eu realizo uma requisição PUT com o ID do usuário e as informações a serem atualizadas
    Então deve-se ter a confirmação da atualização do usuário no sistema
    E o retorno da requisição deve seguir o contrato JSON esperado

  ##################################################################################################
  #   Patch Users                                                                            #
  ##################################################################################################

  @patch_update_user_by_id
  Cenario: Realizar uma requisição PATCH para atualizar parcialmente um usuário por ID na plataforma Regres In
     E possuo um payload valido para criação de pessoa
    E forneço as informações de acordo com o formato requerido pelo serviço de criação de pessoa.
    E deve se ter a confirmação do cadastro de pessoa física
    E que eu possuo um ID válido de um usuário
    E que possua um payload para atualização parcial do usuário
    Quando eu realizo uma requisição PATCH com o ID do usuário e as informações parciais a serem atualizadas
    Então deve-se ter a confirmação da atualização parcial do usuário no sistema
    E o retorno da requisição deve seguir o contrato JSON esperado

