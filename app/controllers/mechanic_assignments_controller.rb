class MechanicAssignmentsController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mechanic_id])
    MechanicAssignment.create!(mechanic_id: params[:mechanic_id], ride_id: params[:ride_id])

    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end
end
