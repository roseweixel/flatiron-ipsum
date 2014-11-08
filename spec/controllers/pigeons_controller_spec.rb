require 'spec_helper'

describe "PigeonsController" do
  describe "index page: GET /pigeons" do
    before do
      Pigeon.create(name: "Cher Ami" , color: "red, grey", lives: "Paris"        , gender: "female")
      Pigeon.create(name: "G. I. Joe", color: "pink, tan", lives: "Great Britain", gender: "male"  )
      get '/pigeons'
    end

    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end

    it "renders the pigeon index template" do
      expect(last_response.body).to include("Cher Ami")
      expect(last_response.body).to include("G. I. Joe")
    end
  end

  describe "show page: GET /pigeons/:id/" do
    before do
      cher = Pigeon.create(name:  "Cher Ami", color: "red, grey", lives: "Paris",         gender: "female")
      get "/pigeons/#{cher.id}"
    end

    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end

    it "renders the show page for the pigeons's list of attributes" do
      expect(last_response.body).to include("Cher Ami")
      expect(last_response.body).to include("red, grey")
      expect(last_response.body).to include("Paris")
    end
  end

  describe "edit page: GET /pigeons/:id/edit" do
    before do
      cher = Pigeon.create(name:  "Cher Ami", color: "red, grey", lives: "Paris",         gender: "female")
      get "/pigeons/#{cher.id}/edit"
    end

    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end

    it "renders the show page for the pigeons's list of attributes" do
      expect(last_response.body).to include("Cher Ami")
      expect(last_response.body).to include("red, grey")
      expect(last_response.body).to include("Paris")
    end
  end

  describe "new page: GET /pigeons/new" do
    before do
      get '/pigeons/new'
    end

    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end

    it "renders the new pigeon form" do
      expect(last_response.body).to include("</form>")
    end
  end

  describe "POST /pigeons" do
    before do
      post '/pigeons', {
       :name =>"Phil",
       :gender=>"male",
       :color=>"black, grey",
       :lives=>"Meatpacking District"
      }
      follow_redirect!
    end

    it "redirects to the pigeons index page" do
      expect(last_request.url).to eq("http://example.org/pigeons")
      expect(last_response.body).to include("Phil")
    end
  end

  describe "destroy: POST /pigeons/id/destroy" do
    before do
      cher = Pigeon.create(name: "Cher Ami" , color: "red, grey", lives: "Paris"        , gender: "female")
      joey = Pigeon.create(name: "G. I. Joe", color: "pink, tan", lives: "Great Britain", gender: "male"  )
      post "/pigeons/#{cher.id}/destroy"
      follow_redirect!
    end

    it "redirects to the pigeons index page" do
      expect(last_request.url).to eq("http://example.org/pigeons")
      expect(last_response.body).to include("G. I. Joe")
      expect(last_response.body).to_not include("Cher Ami")
    end
  end

  describe "update: POST /pigeons/id/update" do
    before do
      cher = Pigeon.create(name: "Cher Ami" , color: "red, grey", lives: "Paris"        , gender: "female")
      joey = Pigeon.create(name: "G. I. Joe", color: "pink, tan", lives: "Great Britain", gender: "male"  )
      post "/pigeons/#{cher.id}/update", {
        :name =>"Cher Ami",
        :gender=>"female",
        :color=>"green, blue",
        :lives=>"Paris"
      }
      follow_redirect!
    end

    it "redirects to the pigeons index page" do
      expect(last_request.url).to eq("http://example.org/pigeons")
      expect(last_response.body).to include("Cher Ami")
      expect(last_response.body).to include("green, blue")
      expect(last_response.body).to_not include("red, grey")
    end
  end

end