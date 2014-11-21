class GoodCat
  @@number_of_cats = 0 # class variable

  def initialize
    @@number_of_cats += 1
  end

  def self.total_number_of_cats # class method
    @@number_of_cats
  end
end

puts GoodCat.total_number_of_cats

cat1 = GoodCat.new
cat2 = GoodCat.new

puts GoodCat.total_number_of_cats