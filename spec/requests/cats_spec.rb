require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Harry',
        age: 21,
        enjoys: 'Still being alive',
        image: 'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
      )
      
      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end
end

describe "POST /create" do
   it "creates a cat" do
    cat_params = {
      cat: {
        name: 'Meowman',
        age: 12,
        enjoys: "Chasing mail man",
        image: 'https://i.etsystatic.com/26335741/r/il/caca72/3015003196/il_794xN.3015003196_e6c4.jpg'
    }
  }

  post '/cats', params: cat_params
  expect(response).to have_http_status(200)
  cat = Cat.first
  expect(cat.name).to eq 'Meowman'
  expect(cat.age).to eq 12
  expect(cat.enjoys).to eq 'Chasing mail man'
  expect(cat.image).to eq 'https://i.etsystatic.com/26335741/r/il/caca72/3015003196/il_794xN.3015003196_e6c4.jpg'
   end
end

