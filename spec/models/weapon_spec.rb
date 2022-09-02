require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it "returns the weapon current power" do
    weapon = create(:weapon)
    power_weapon = (weapon.power_base + ((weapon.level - 1) * weapon.power_step))
    expect(weapon.current_power).to eq(power_weapon)

    puts "Weapon power: #{weapon.current_power}"
  end

  it 'returns the correct weapon title' do
    weapon = create(:weapon)
    expect(weapon.title).to eq("#{weapon.name} ##{weapon.level}")

    puts "Weapon name: #{weapon.title}"
  end

  it "returns if the weapon bonus power is more than 8000" do
    weapon = create(:weapon)
    expect(weapon.bonus_power).to be > (7000)

    puts "ARGH... É MAIS DE #{weapon.bonus_power}"
  end

end
