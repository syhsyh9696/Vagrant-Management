module Upload
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    VALID_PARAMS = %w(status content user_id experiment_id)
    
    helpers do 
      def submission_params
        params.select{|key,value| VALID_PARAMS.include?(key.to_s)}
      end
    end

    resource :submissions do 
      desc 'Create new submission'
      params do 
        requires :status, type: Boolean, desc: 'Submission return status' 
        requires :content, type: String, desc: 'Submission return content'
        requires :user_id, type: Integer, desc: 'User ID'
        requires :experiment_id, type: Integer, desc: 'Experiment ID'
      end
      post do 
        submission = Submission.new(submission_params)
        if submission.save
          return {message: "success"}
        else
          return {message: "false"}
        end
      end

    end


  end
end