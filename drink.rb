class Drink

attr_reader :name, :price
attr_accessor :abv #cn be a reader instead

def initialize(name, price, alcohol_content)
  @name = name
  @price = price
  @abv = alcohol_content
end


end #class end
