class Bird
  include Mongoid::Document


  field :name, type: String
  field :family, type: String
  field :continents,type: String
  field :visible, type: Boolean
  field :added, type:DateTime

  def build(params_hash)
    self.name = params_hash[:name]
    self.family = params_hash[:family]
    self.continents = params_hash[:continents]
    self.visible = params_hash[:visible].blank? ? false : params_hash[:visible]
    self.added = Date.today
  end

end