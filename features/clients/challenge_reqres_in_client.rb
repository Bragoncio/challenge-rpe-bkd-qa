require_relative "challenge_reqres_in_request"


class ChallengeRegresInClient < ChallengeRegresInRequest

    def validate_create_person_regres(payload)
        response_request = post_create_person(payload)
        return response_request
      end

      def validate_register_user_regres(payload)
        response_request = post_register_users(payload)
        return response_request
      end
    
      def contract_schema_register_user(schema)
        case schema
        when "email"
          "challenge_reqres_in/reqres_post_register_user_no_email_400"
        when "password"
          "challenge_reqres_in/reqres_post_register_user_no_password_400"
        else
          raise ArgumentError, "Schema não foi encontrado ou criado: #{schema}"
        end
      end
      
end