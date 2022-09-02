require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  describe "POST /enemies" do
    context 'when the enemy exists' do

    let(:enemy) { create(:enemy) }
    let(:enemy_attributes) { attributes_for(:enemy) }

    before(:each) { put "/enemies/#{enemy.id}", params: enemy_attributes }
      it 'returns status code 200' do
        # enemy = create(:enemy)
        # put "/enemies/#{enemy.id}", params: enemy_attributes
        # enemy_attributes = attributes_for(:enemy)
        expect(response).to have_http_status(200)
      end

      it 'updates the enemy' do
        expect(enemy.reload).to have_attributes(enemy_attributes)
      end

      it 'returns the enemy updated' do
        expect(enemy.reload).to have_attributes(json.except('created_at', 'updated_at'))
      end

    end

    context 'when the enemy does not exist' do
    before(:each) { put '/enemies/0', params: attributes_for(:enemy)}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Enemy/)
      end

    end
  end

  describe 'DELETE /enemies' do
    context 'when enemy exists' do
      let(:enemy) { create(:enemy) }
      before(:each) { delete "/enemies/#{enemy.id}" }
      
      it 'returns status code 200' do
        expect(response).to have_http_status(204)
      end

      it 'destroy the record' do
        expect { enemy.reload }.to raise_error ActiveRecord::RecordNotFound
      end

    end

    context 'when the enemy does not exist' do
    before(:each) { delete '/enemies/0' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Enemy/)
      end

    end
  end

# DESAFIO

  describe 'GET /enemies' do 

    it "return enemy's information" do
      enemy = create(:enemy)
      get enemies_path
      expect(response.body).to include(enemy.name, enemy.power_base.to_s, enemy.power_step.to_s, enemy.level.to_s, enemy.kind)
    end
  end

  describe 'GET /enemies/:id' do
    context 'when it has valid parameters' do

      it "shows enemy's attributes" do
        enemy = create(:enemy)
        get enemies_path(:enemy)
        expect(response).to have_http_status(200)
      end

    end
  end

  describe 'POST /enemies' do
    context 'when it has valid parameters' do

      it 'creates the enemy' do
        enemy_attributes = attributes_for(:enemy)
        post enemies_path, params: enemy_attributes
        expect(Enemy.last).to have_attributes(enemy_attributes)
      end

    end

    context 'when it has no valid parameters' do

      it 'does not creates the enemy' do
        expect{
          post enemies_path, params: { name: '', current_power: '', level: '', kind: ''}
        }.to_not change(Enemy, :count)
      end

    end

  end

end
