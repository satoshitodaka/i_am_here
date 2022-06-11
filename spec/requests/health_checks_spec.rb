require 'rails_helper'

RSpec.describe("HealthChecks", type: :request) do
  describe "ヘルスチェック" do
    it "200のHTTPステータスが買える" do
      get "/health_check"
      expect(response).to have_http_status :ok
    end
  end

end
