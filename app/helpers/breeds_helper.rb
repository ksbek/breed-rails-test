module BreedsHelper
  def breed_list
    begin
      breeds_list = JSON.parse(RestClient.get("https://dog.ceo/api/breeds/list/all").body)["message"]
      breeds = {}
      breeds_list.keys.each do |key|
      	breeds[key.capitalize] = key
      	breeds_list[key].each do |sub_breed|
      		breed = [key, sub_breed].join('-')
      		breeds[breed.titleize] = breed
      	end
      end
      breeds
    rescue Object => e
      []
    end
  end
end
