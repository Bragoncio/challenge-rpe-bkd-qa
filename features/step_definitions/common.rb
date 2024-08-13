#Protocolos Http

def execute_post(params)
    HTTParty.post(params[:uri], body: params[:body], headers: params[:headers])
end