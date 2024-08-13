class ChallengeRegresInRequest

    def commom_regres_in(method)
      {
        "uri": 'https://reqres.in/api' + method,
        "headers": { "Content-Type": "application/json"}
      }
    end
  
    def post_create_person(payload)
      @uri_method = '/users'
      params = commom_regres_in(@uri_method)
      params[:body] = payload.to_json
      execute_post(params)
    end
end    