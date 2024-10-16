# frozen_string_literal: true

require_relative './spec_helper'

RSpec.describe Door do
  let(:door) { Door.new(1, Car.new) }

  it "has an ID" do
    expect(door.id).to eq(1)
  end

  it "can check if it has a car" do
    expect(door.has_car?).to be true
  end

  it "can be opened" do
    door.open
    expect(door.is_opened).to be true
  end
end

RSpec.describe Host do
  let(:car) { Car.new }
  let(:goat) { Goat.new }
  let(:door1) { Door.new(1, car) }
  let(:door2) { Door.new(2, goat) }
  let(:door3) { Door.new(3, goat) }
  let(:doors) { [door1, door2, door3] }
  let(:host) { Host.new(doors) }

  before do
    # Убедимся, что двери закрыты перед каждым тестом
    doors.each(&:close)
  end

  describe '#update' do
    context 'when player selects a door with a car' do
      let(:player) { Player.new(doors) }

      before do
        player.add_new_observer(host)
        player.choose_door(1)  # Игрок выбирает дверь с машиной
      end

      it 'opens a door with a goat' do
        expect(host.opened_door.is_opened).to be true
        expect(host.opened_door.has_car?).to be false
      end

      it 'does not open the selected door' do
        expect(player.selected_door.is_opened).to be false
      end
    end

    context 'when player selects a door with a goat' do
      let(:player) { Player.new(doors) }

      before do
        player.choose_door(2)  # Игрок выбирает дверь с козой
        host.update(player)     # Ведущий открывает одну из оставшихся дверей
      end

      it 'opens a door with a goat' do
        expect(host.opened_door.is_opened).to be true
        expect(host.opened_door.has_car?).to be false
      end

      it 'does not open the selected door' do
        expect(player.selected_door.is_opened).to be false
      end
    end

    context 'when all doors have cars' do
      let(:door1) { Door.new(1, car) }
      let(:door2) { Door.new(2, car) }
      let(:door3) { Door.new(3, car) }
      let(:doors) { [door1, door2, door3] }
      let(:player) { Player.new(doors) }

      it 'raises an error' do
        player.choose_door(1)  # Игрок выбирает любую дверь
        expect { host.update(player) }.to raise_error(ArgumentError, "All doors have cars as a prize")
      end
    end
  end
end