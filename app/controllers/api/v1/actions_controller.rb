class Api::V1::ActionsController < Api::V1::BaseController

  def index
    respond_with(Actions.all)
  end

  def create
    respond_with(:api, :v1, Actions.create(action_params))
  end

  def destroy
    respond_with Actions.destroy(params[:id])
  end

  def update
    action = Actions.find(params["id"])
    action.update_attributes(action_params)
    respond_with(action, json: action)
  end

  private
  
  def action_params
    params.require(:action).permit(:legislator_id, :checklist_id, :category)
  end

end