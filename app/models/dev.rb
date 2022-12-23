class Dev < ActiveRecord::Base
   has_many :freebies
   has_many :companies, through: :freebies

   def received_one?(item_name)
    # 1. One way
    #   self.freebies.any? do |freebie|
    #     freebie.item_name == item_name
    #   end
    # 2. Another way credit: Caitlin
    #  freebies.exists? item_name: item_name
    # 3. Third way credit: Caitlin
    freebies.map {|free| free.item_name}.include? item_name
   end
   def give_away(freebie, dev)
    #  freebie.update(dev: dev) unless freebie.dev !=self
      freebie.dev == self ? freebie.update(dev: dev) : "not yours!" # credit: Ryan
   end
end
