class BikeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bike_mailer.parts_expired.subject
  #
  def parts_expired(bike)
    @greeting = "Dear"
    @client = bike.client
    @bike = bike
    @part = bike.expired_parts
    
    mail to: bike.client.email
  end
end
