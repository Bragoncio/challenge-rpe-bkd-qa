Dado('que eu tenha acesso à API Reqres In') do
end

E("possuo um payload valido para criação de pessoa") do
  @payload = create_person_payload
end

Quando('forneço as informações de acordo com o formato requerido pelo serviço de criação de pessoa.') do
  @response = ChallengeRegresInClient.new.validate_create_person_regres(@payload)
end

Entao('deve se ter a confirmação do cadastro de pessoa física') do
  verify_status_code_request(@response, 201)
  @response_parsed = request_parse_json(@response)
  log_data("Validação do Create realizada com sucesso")
  @contract_schema = "challenge_reqres_in/reqres_post_create_user_200"
end

E("o retorno da requisição deve seguir o contrato JSON esperado") do
  verify_contract(@response_parsed, @contract_schema)
end

E("possuo um payload valido para registro de usuario") do
  @payload = register_users_payload
end

Quando("forneço as informações de acordo com o formato requerido pelo serviço de criação dos usuarios.") do
  @response = ChallengeRegresInClient.new.validate_register_user_regres(@payload)
end

Entao("deve se ter a confirmação do usuario da pessoa cadastrado no sistema") do
  verify_status_code_request(@response, 200)
  @response_parsed = request_parse_json(@response)
  log_data("Validação do Register realizado com sucesso")
  @contract_schema = "challenge_reqres_in/reqres_post_register_user_200"
end

E("que o campo {string} não esteja preenchido no payload de registro") do |field_payload|
  @field_payload = field_payload
  @payload = register_users_payload
  @payload.delete(field_payload.to_sym)
  log_data("Enviado o payload sem o campo #{field_payload}")
end

Entao("o sistema não prossegue com a solicitação retornando a mensagem de error {string} e o status {int}") do |message_error, status_code|
  verify_status_code_request(@response, status_code)
  @response_parsed = request_parse_json(@response)
  expect(@response['error']).to eq(message_error)
  @contract_schema = ChallengeRegresInClient.new.contract_schema_register_user(@field_payload)
end

E('que eu possuo um ID válido de um usuário cadastrado') do
  @user_id = @response['id']
end

Quando('eu realizo uma requisição GET com o ID do usuário') do
  @response = ChallengeRegresInClient.new.validate_get_single_user_regres(@user_id)
end

Então('deve-se retornar as informações do usuário correspondente') do
  verify_status_code_request(@response, 200)
  @response_parsed = request_parse_json(@response)
  log_data("Validação do Get realizado com sucesso")
  @contract_schema = "challenge_reqres_in/reqres_get_single_user_200"
end