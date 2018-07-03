class BreedsController < ApplicationController

  def index
    @breed_name = 'affenpinscher'
    if params['breed']
      @breed_name = params['breed']
    end

    @dog_url = ''
    begin
      @dog_url = JSON.parse(RestClient.get("https://dog.ceo/api/breed/#{@breed_name.gsub('-', '/')}/images/random").body)['message']
    rescue Object => e
    end
  end
end
