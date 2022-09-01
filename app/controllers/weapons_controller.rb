class WeaponsController < ApplicationController
  before_action :set_weapon, only: [:show, :destroy]

  def index
    @weapons = Weapon.all
  end

  def create
    @weapons = Weapon.create(weapon_params)
    redirect_to weapons_path
  end

  def destroy
    @weapon.destroy
    redirect_to weapons_path
  end

  def show
  end

  private

    def set_weapon
      @weapon = Weapon.find(params[:id])
    end

    def weapon_params
      params.require(:weapon).permit(:name, :description, :power_base, :power_step, :level)
    end

end
