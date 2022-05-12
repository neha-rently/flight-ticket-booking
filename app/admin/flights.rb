ActiveAdmin.register Flight do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :flight_no, :journey_date, :arr_time, :dep_time, :departing, :arriving, :flight_status, :seats_available
  #
  # or
  #
  # permit_params do
  #   permitted = [:flight_no, :journey_date, :arr_time, :dep_time, :departing, :arriving, :flight_status, :seats_available]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end