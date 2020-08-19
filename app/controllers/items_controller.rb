class ItemsController < ApplicationController
  def index
  end

private

def item_params
  params.require(:item).permit(:image,:name,:text,:category,:condition,:postage,:ship_from,:ship_date,:price).merge(user_id:current_user.id)
end

end
