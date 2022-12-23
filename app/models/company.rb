class Company < ActiveRecord::Base
   has_many :freebies
   has_many :devs, through: :freebies
   def give_freebie(dev, item_name, value)
     Freebie.create(item_name: item_name, item_value: value, company_id: self.id, dev_id: dev.id)
   end
   def oldest_company
     #Company.where("founding_year = ?", Company.minimum(:founding_year))
     #self.all.order(:founding_year).first
     Company.all.min_by { |company| company.founding_year }
   end
end
