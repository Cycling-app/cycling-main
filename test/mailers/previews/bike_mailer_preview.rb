# Preview all emails at http://localhost:3000/rails/mailers/bike_mailer
class BikeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/bike_mailer/parts_expired
  def parts_expired
    BikeMailer.parts_expired
  end

end
