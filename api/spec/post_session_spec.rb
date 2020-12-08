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

  examples = [
    {
      title: "senha incorreta",
      payload: { email: "neyma@psg.com", password: "pwdqwerty" },
      code: 401,
      error: "Unauthorized",
    },
    {
      title: "email nao cadastrado",
      payload: { email: "neyma@psps.com", password: "pwd123" },
      code: 401,
      error: "Unauthorized",
    },
    {
      title: "email em branco",
      payload: { email: "", password: "pwd123" },
      code: 412,
      error: "required email",
    },
    {
      title: "senha em branco",
      payload: { email: "neyma@psg.com", password: "" },
      code: 412,
      error: "required password",
    },
    {
      title: "sem o campo email ",
      payload: { password: "pwd123" },
      code: 412,
      error: "required email",
    },
    {
      title: "sem o campo senha ",
      payload: { email: "neyma@psg.com" },
      code: 412,
      error: "required password",
    },
    {
      title: "email incorreto",
      payload: { email: "neyma#psg.com", password: "pwd123" },
      code: 412,
      error: "wrong email",
    },
  ]

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Sessions.new.login(e[:payload])
      end

      it "valida status code" do
        expect(@result.code).to eq e[:code]
      end

      it "valida tamanho do id" do
        expect(@result.parsed_response["error"]).to eq "#{e[:error]}"
      end
    end
  end
end
