ActiveAdmin.register Ticket do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :checkin_status, :seat_class, :seat_no, :luggage, :food, :passenger_id, :flights_id, :users_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:checkin_status, :seat_class, :seat_no, :luggage, :food, :passenger_id, :flights_id, :users_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
