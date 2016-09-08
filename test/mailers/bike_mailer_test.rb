require 'test_helper'

class BikeMailerTest < ActionMailer::TestCase
  test "parts_expired" do
    mail = BikeMailer.parts_expired(bikes(:one))
    assert_equal "Parts expired", mail.subject
    assert_equal ["this@one.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Dear", mail.body.encoded
  end
end
