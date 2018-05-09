module Test
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    desc 'Return hello'
    get :hello do 
      return {Message: 'Hello'}
    end
  end
end