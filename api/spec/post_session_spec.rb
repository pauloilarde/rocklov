require_relative "routes/sessions"

describe "POST /sessions" do
  context "login com sucesso" do
    before(:all) do
      payload = {
        email: "neyma@psg.com",
        password: "pwd123",
      }
      @result = Sessions.new.login(payload)
    end

    it "valida status code" do
      expect(@result.code).to eq 200
    end

    it "valida tamanho do id" do
      expect(@result.parsed_response["_id"].length).to eq 24
    end
  end

  context "senha inválida" do
    before(:all) do
      payload = {
        email: "neyma@psg.com",
        password: "pwdqwerty",
      }
      @result = Sessions.new.login(payload)
    end

    it "valida status code" do
      expect(@result.code).to eq 401
    end

    it "valida tamanho do id" do
      expect(@result.parsed_response["error"]).to eq "Unauthorized"
    end
  end
end
