# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

classes = {
  "Warrior" => [2, 1, 2, 0, 1, 0],
  "Rogue" => [1, 2, 1, 1, 2, 0],
  "Wizard" => [0, 1, 0, 2, 2, 0],
}

races = {
  "Human" => [1, 1, 1, 1, 1, 0],
  "Elf" => [0, 2, 0, 1, 2, 0],
  "Dwarf" => [2, 1, 2, 0, 0, 0],
}

classes.map{|key, value|
  if PcClass.find_by_name(key)
    puts "PcClass #{key} already exists."
  else
    record = PcClass.new
    record.name = key
    record.str_gain = value[0]
    record.dex_gain = value[1]
    record.vit_gain = value[2]
    record.int_gain = value[3]
    record.wis_gain = value[4]
    record.spd_gain = value[5]
    record.save!
  end
}

races.map{|key, value|
  if Race.find_by_name(key)
    puts "Race #{key} already exists."
  else
    record = Race.new
    record.name = key
    record.str_gain = value[0]
    record.dex_gain = value[1]
    record.vit_gain = value[2]
    record.int_gain = value[3]
    record.wis_gain = value[4]
    record.spd_gain = value[5]
    record.save!
  end
}

master_settings = GameSettings.new(:max_level => 10, :level_formula => "((level * 100) * 2) + ((level * 100) * 0.85)")
master_settings.save!


# if PcClass.find_by_name("Warrior")
#   war = PcClass.new("Warrior", 2, 1, 2, 0, 1, 0)
#   war.save!
# end

# if PcClass.find_by_name("Rogue")
#   rog = PcClass.new("Rogue", 1, 2, 1, 1, 2, 0)
#   rog.save!
# end

# if PcClass.find_by_name("Wizard")
#   wiz = PcClass.new("Wizard", 0, 1, 0, 2, 2, 0)
#   wiz.save!
# end

# if Race.find_by_name("Human")
#   hum = Race.new("Human", 1, 1, 1, 1, 1, 0)
#   hum.save!
# end

# if Race.find_by_name("Elf")
#   elf = Race.new("Elf", 0, 2, 0, 1, 2, 0)
#   elf.save!
# end

# if Race.find_by_name("Dwarf")
#   dwa = Race.new("Dwarf", 2, 1, 2, 0, 0, 0)
#   dwa.save!
# end