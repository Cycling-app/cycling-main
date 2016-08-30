require 'test_helper'

class OauthControllerTest < ActionDispatch::IntegrationTest

  test "cannot get token if code is invalid" do
    VCR.use_cassette("oauth-invalid-code") do
      post oauth_strava_url, params: {code: '123asd'}
      payload = JSON.parse(response.body)
      assert_equal payload["errors"]["full_messages"], "Code is invalid"
    end
  end

  test "can get token if code is valid" do
    VCR.use_cassette("oauth-valid-code") do
      post oauth_strava_url, params: {code: '4db91af1260b3f47af7f2dbb32fc95db9e13fc30'}
      payload = JSON.parse(response.body)
      assert_equal "7549577c5d2a8a55a8a0d8984c98b5df2a34f63b", payload["access_token"]
    end
  end

  test "does not recreate an existing user" do
    VCR.use_cassette("oauth-valid-code") do
      client = Client.create!(email: "csaminak@yahoo.com")
      post oauth_strava_url, params: {code: '4db91af1260b3f47af7f2dbb32fc95db9e13fc30'}
      payload = JSON.parse(response.body)
      assert_equal payload["athlete"]["email"], "csaminak@yahoo.com"
      assert_equal payload["client"]["id"], client.id
    end
  end

end
