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