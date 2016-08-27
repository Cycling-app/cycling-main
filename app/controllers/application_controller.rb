class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def json_errors(active_record_object)
    {
      json:
       {
         errors: {
           fields: active_record_object.errors,
           full_messages: active_record_object.errors.full_messages
         }

       },
      status: :unprocessable_entity
    }
  end
end
