class Api::V1::ActionsController < Api::V1::BaseController

  def create
    action = Action.new(action_params)
    action.save
    respond_with(action, json: action)
  end

  def destroy
    respond_with Action.destroy(params[:id])
  end

  private
  
  def action_params
    params.permit(:legislator_id, :checklist_id, :category)
  end

end
