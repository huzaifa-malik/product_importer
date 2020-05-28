class Product < ApplicationRecord
  # validates_uniqueness_of :part_number
  # validates_presence_of :part_number, :branch, :price
  # validates :branch_id, inclusion: { in: Structs::Branch.all.map(&:id) }


  def branch_name
    Structs::Branch.find(branch_id)&.name
  end
end
