require 'rails_helper'

RSpec.describe Enemy, type: :model do
  RSpec.describe Enemy, type: :model do
  it "returns the enemy current power" do
    enemy = create(:enemy)
    power_weapon = (enemy.power_base + ((enemy.level - 1) * enemy.power_step))
    expect(enemy.current_power).to eq(power_weapon)
  end
end
