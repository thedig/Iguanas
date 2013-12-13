module IguanasHelper
  def is_owner?
    @is_owner = (current_user.id == Iguana.find(params[:id]).user_id) if @is_owner.nil?
    @is_owner
  end
end