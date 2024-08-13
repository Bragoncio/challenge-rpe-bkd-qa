#Protocolos Http

def execute_post(params)
    HTTParty.post(params[:uri], body: params[:body], headers: params[:headers])
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