require_relative "routes/signup"
require_relative "libs/mongo"

describe "POST /signup" do
  context "login com sucesso" do
    before(:all) do
      payload = {
        name: "Paulo",
        email: "paulo@abc.com",
        password: "pwd123",
      }

      MongoDB.new.remove_user(payload[:email])
      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eq 200
    end

    it "valida tamanho do id" do
      expect(@result.parsed_response["_id"].length).to eq 24
    end
  end
end
