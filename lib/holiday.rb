require 'pry'

#Task 1
def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  holiday_supplies[:summer][:fourth_of_july][1]      # I am using holiday_supplies instead of holiday_hash here and for the other tasks. My preference. But can use both.
end




#Task 2

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_supplies[:winter][:new_years] << supply
  holiday_supplies[:winter][:christmas] = supply
    #  holiday_supplies[:winter][:new_years] = supply
end

#OR
def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  # holiday_hash[:winter][:christmas] << supply
  holiday_supplies[:winter].each do |holiday, collection|
    collection << supply
    puts collection
  end
end




#Task 3
def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
    holiday_supplies[:spring].each do |holiday, collection|
    collection << supply
    puts collection
  end
end

#Or
def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_supplies[:spring][:memorial_day]<< supply
end



#Task 4
def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
holiday_supplies[season] = {
  holiday_name => supply_array
}
end

#Or
def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_supplies[season][holiday_name] = supply_array  
  holiday_supplies
end



#Task 5
def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_supplies[:winter].values.flatten
end



#Task 6
def all_supplies_in_holidays(holiday_hash)
  holiday_supplies.each do |season, holiday|
    puts "#{season.capitalize}:"
    holiday.each do |holiday, item|
      puts "  #{holiday.to_s.split("_").collect {|i| i.capitalize}.join(" ")}: #{item.join(", ")}"
    end
 end 
end

#Or
def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_supplies.each do |holiday_season, collection|
    puts "#{holiday_season}:".capitalize 
    collection.each do |holiday, supply|
      holiday = holiday.to_s.split("_").collect {|i| i.capitalize}.join(" ") << ":"   
                # ("_") helps to ensure each word in "new_year" is capitalized and not just the first word.
                # alternatively, could replace ".collect" with ".map"
      supply = supply.join(", ")
      puts "  " + holiday + " " + supply  #the first string in this line has two empty spaces
    end
  end
end



#Task 7
def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  new_array = []
  holiday_supplies.collect do |season, collection|
    collection.collect do |holiday, supply|
    if supply.include?("BBQ")
      new_array << holiday
      end
    end
  end
  new_array.flatten
end

#Or
def all_holidays_with_bbq(holiday_hash)
  new_array = []
  holiday_supplies.each do |season, collection|
    new_array << collection.keys if collection.values.flatten.include?("BBQ")
  end
  new_array.flatten
end








