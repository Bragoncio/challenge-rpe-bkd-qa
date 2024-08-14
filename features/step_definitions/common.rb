#Protocolos Http

def execute_post(params)
    HTTParty.post(params[:uri], body: params[:body], headers: params[:headers])
end

def execute_get(params)
  HTTParty.get(params[:uri], query: params[:body], headers: params[:headers])
end

def execute_put(params)
  HTTParty.put(params[:uri], body: params[:body], headers: params[:headers])
end

def execute_patch(params)
  HTTParty.patch(params[:uri], body: params[:body], headers: params[:headers])
end


def request_parse_json(request, message = "Response")
    return request.body if request.body.empty?
 
   begin
     response = JSON.parse(request.body)
     log_data("Challenge Reqres Log: #{Time.now} - #{message}: #{JSON.pretty_generate(response)}")
   rescue JSON::ParserError => error_json
     log_json_parse_error(error_json, request.body)
     response = request.body
   end
   response
 end

 def log_json_parse_error(error_json, body)
    puts("Challenge Reqres Log: #{Time.now} - Erro ao parsear: #{error_json}")
    log_data("Response: #{body}")
  end
  
  def log_data(message)
    # Confere e converte para UTF-8 caso seja necessário.
    if message.encoding.to_s != "UTF-8"
      puts("Challenge Reqres Log: #{Time.now} - O encoding retornado não é compatível com UTF-8")
      message = message.to_s.force_encoding("UTF-8")
    end
  
    log_file_name = 'evidence_log_temporary.txt'
  
      begin
        File.open(log_file_name, 'a') do |log|
          log.puts("\n #{message} \n")
        end
      rescue => exception_log
        puts("Exceção ao gravar log: #{exception_log}")
        log.puts("\n #{message} \n")
      end
  end

  def log_request_details(request)
    log_data("Challenge Reqres Log: #{Time.now} - URL Request: #{request.request.last_uri}")
    log_data("Challenge Reqres Log: #{Time.now} - Method Request: #{request.request.http_method.to_s.split("::")[2].upcase}")
    log_data("Challenge Reqres Log: #{Time.now} - DateHour Request: #{formatted_date_time(request.headers["date"])}")
  end

  def verify_status_code_request(request, expect_value)
    log_request_details(request)

    if request.request.options[:body].blank?
      log_data("Challenge Reqres Log: #{Time.now} - A requisição não possui payload")
    else
      log_data("Challenge Reqres Log: #{Time.now} - Payload Enviado: #{loggable_payload(request.request.options[:body])}")
    end

    log_data("Challenge Reqres Log: #{Time.now} - HTTP Code Esperado: #{expect_value} - HTTP Code Recebido: #{request.code}")

    expect(request.code).to eq(expect_value)

  rescue RSpec::Expectations::ExpectationNotMetError => e
    log_error_response(request)
    raise e
  end

#Converte Data e hora em String para Time subtraindo 3 horas
  def formatted_date_time(date_string)
    Time.parse(date_string) - 10800
  end

#Converter o payload enviado no body para um formato Json string formatado
  def loggable_payload(payload)
    JSON.pretty_generate(JSON.parse(payload))
  rescue JSON::ParserError
    payload
  end

#Registra informações relacionado a uma resposta de erro no log
  def log_error_response(request)
    response_error = loggable_payload(request.body) if request.request.options[:body].to_s != '' || request.parsed_response != nil
    log_data("Challenge Reqres Log: #{Time.now} - Response de Error: #{response_error}")
  end

#Validar o response se atende o esquema Json
def validate_json_schema(response, schema)
  JSON::Validator.validate!(schema, response)
end

def load_contract(contract_name)
  JSON.parse(File.read("#{SCHEMA_PATH}/#{contract_name}.json"))
rescue StandardError => e
  raise ArgumentError, "Challenge Reqres Log: #{Time.now} - Não foi possivel carregar o contrato: #{e.message}"
end


def verify_contract(response, schema)
  log_data("Challenge Reqres Log: #{Time.now} - iniciando a verificação do contrato.")

  begin
  response_validate_contract =  expect(response).to match_json_schema(schema)
  rescue RSpec::Expectations::ExpectationNotMetError => error_schema
   raise ArgumentError, "Challenge Reqres Log: #{Time.now} - erro encontrado: #{error_schema}"
  end

  log_data("Challenge Reqres Log: #{Time.now} - Verificação do contrato - Garantindo que as chaves esperadas coincidam com as chaves recebidas.")
  schema_contract = load_contract(schema)
  begin
    @contract_field = schema_contract["properties"].keys
    @response_field = response.keys
  rescue => exception
    @contract_field = schema_contract['items']['properties'].keys
    @response_field = response[0].keys
  end

  log_data("Challenge Reqres Log: #{Time.now} - Verificação do contrato - Campos esperados no contrato: #{JSON.pretty_generate(@contract_field)}")
  log_data("Challenge Reqres Log: #{Time.now} - Verificação do contrato - Campos recebido do response: #{JSON.pretty_generate(@response_field)}")

  compare_fields = @contract_field - @response_field
  raise ArgumentError, ("Challenge Reqres Log: #{Time.now} - erro encontrado - Divergências nos campos do contrato: #{JSON.pretty_generate(compare_fields)}") if compare_fields != []
end