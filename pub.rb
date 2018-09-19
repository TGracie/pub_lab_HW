class Pub

  attr_reader :name
  attr_accessor :drinks, :till

  def initialize(name)
    @name = name
    @drinks = []
    @till = 0
  end

  def stock(pub)
    return pub.drinks.count
  end

end #class end
