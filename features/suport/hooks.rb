Before do |scenario|
    #Gera um arquivo temporario para armazenar os logs das requisições
    @log_data = File.new('evidence_log_temporary.txt', 'w')
    
  end
  
  
  After do |scenario|
    @log_data = File.read("evidence_log_temporary.txt")
  
  end