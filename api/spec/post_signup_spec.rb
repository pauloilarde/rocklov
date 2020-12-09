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

  context "usuario ja existe" do
    before(:all) do
      payload = {
        name: "Bob",
        email: "bob@skate.com",
        password: "pwd123",
      }

      MongoDB.new.remove_user(payload[:email])
      Signup.new.create(payload)
      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eq 409
    end

    it "valida mensagem de erro" do
      expect(@result.parsed_response["error"]).to eq "Email already exists :("
    end
  end

  examples = [
    {
      title: "email invalido",
      payload: { name: "Dudu", email: "dudu#palmeiras.com", password: "pwd123" },
      code: 412,
      error: "wrong email",
    },
    {
      title: "nome em branco",
      payload: { name: "", email: "dudu@palmeiras.com", password: "pwd123" },
      code: 412,
      error: "required name",
    },
    {
      title: "email em branco",
      payload: { name: "Dudu", email: "", password: "pwd123" },
      code: 412,
      error: "required email",
    },
    {
      title: "senha em branco",
      payload: { name: "Dudu", email: "dudu@palmeiras.com", password: "" },
      code: 412,
      error: "required password",
    },
    {
      title: "faltando o campo nome",
      payload: { email: "dudu@palmeiras.com", password: "pwd123" },
      code: 412,
      error: "required name",
    },
    {
      title: "faltando campo email",
      payload: { name: "Dudu", password: "pwd123" },
      code: 412,
      error: "required email",
    },
    {
      title: "faltando o campo senha",
      payload: { name: "Dudu", email: "dudu@palmeiras.com" },
      code: 412,
      error: "required password",
    },
  ]

  context "campo faltando" do
    examples.each do |e|
      context "#{e[:title]}" do
        before(:all) do
          @result = Signup.new.create(e[:payload])
        end

        it "valida status code" do
          expect(@result.code).to eq e[:code]
        end

        it "valida mensagem de erro" do
          expect(@result.parsed_response["error"]).to eq "#{e[:error]}"
        end
      end
    end
  end
end
