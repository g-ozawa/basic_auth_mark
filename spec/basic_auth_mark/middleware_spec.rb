RSpec.describe BasicAuthMark::Middleware do
  let(:env) { {'HTTP_AUTHORIZATION' => 'Basic xxx'} }
  let(:headers) { {'Content-Type' => 'text/html; charset=utf-8'} }
  let(:body) { ['<html><head></head><body></body></html>'] }
  let(:status) { 200 }
  let(:app) { double call: [status, headers, body] }
  subject { BasicAuthMark::Middleware.new(app) }

  context 'basic authentication disabled' do
    it "does not insert basic_auth mark" do
      status, headers, body = subject.call({})
      expect(status).to eq(200)
      expect(headers).to include('Content-Type' => 'text/html; charset=utf-8')
      expect(body).to eq(["<html><head></head><body></body></html>"])
    end
  end

  context 'basic authentication enabled' do
    it "inserts basic_auth mark" do
      status, headers, body = subject.call(env)
      expect(status).to eq(200)
      expect(headers).to include('Content-Type' => 'text/html; charset=utf-8')
      expect(body).not_to eq(["<html><head></head><body></body></html>"])
      expect(body[0]).to include("BASIC AUTH")
    end
  end

  context "not html request" do
    let(:headers) { {'Content-Type' => 'application/json;'} }
    it "does not insert basic_auth_mark" do
      status, headers, body = subject.call(env)
      expect(status).to eq(200)
      expect(headers).to include('Content-Type' => 'application/json;')
      expect(body).to eq(['<html><head></head><body></body></html>'])
    end
  end

  context "redirection" do
    let(:status) { 302 }
    it "does not insert basic_auth_mark" do
      status, headers, body = subject.call(env)
      expect(status).to eq(302)
      expect(headers).to include('Content-Type' => 'text/html; charset=utf-8')
      expect(body).to eq(['<html><head></head><body></body></html>'])
    end
  end
end
