class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  before_save(:capitalize_name)
  validates(:name, :presence => true)

  private
  define_method(:capitalize_name) do
    self.name=(name().capitalize())
  end
end
