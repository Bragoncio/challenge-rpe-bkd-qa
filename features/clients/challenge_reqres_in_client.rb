require_relative "challenge_reqres_in_request"


class ChallengeRegresInClient < ChallengeRegresInRequest

    def validate_create_person_regres(payload)
        response_request = post_create_person(payload)
        return response_request
      end


      
end