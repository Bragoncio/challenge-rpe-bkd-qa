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

    def post_register_users(payload)
      @uri_method = '/register'
      params = commom_regres_in(@uri_method)
      params[:body] = payload.to_json
      execute_post(params)
    end

    def get_single_users(id_user)
      @uri_method = "/register/#{id_user}"
      params = commom_regres_in(@uri_method)
      execute_get(params)
    end

    def put_register_users(id_user, payload)
      @uri_method = "/register/#{id_user}"
      params = commom_regres_in(@uri_method)
      params[:body] = payload.to_json
      execute_put(params)
    end


end    