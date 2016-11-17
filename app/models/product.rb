class Product < ApplicationRecord

  def pretty_time
    return created_at.strftime("%A, %d %b")
  end


end
