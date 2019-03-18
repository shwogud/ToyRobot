require 'rspec'
require_relative '../lib/table'

describe 'Table' do 
  let(:table) { Table.new }

  describe '#new' do
    it 'creates an instance of Table' do
      expect(table).to be_a Table
    end
  end

  describe '#rows' do
    it 'checks that there are 5 rows' do
      length = 0
      for i in 0...5 do
        length += 1 if table.table[i]
      end
      expect(length).to eq 5
    end
  end

  describe '#rows' do
    it 'checks that there are 5 columns' do
      expect(table.table[0].length).to eq 5
    end
  end

  describe 'add_robot' do 
    it 'checks to see if robot was added to table' do
      table.add_robot([1,2], 'north')

      expect(table.table[2][1]).to eq "\e[0;31;49m↑\e[0m"
    end
  end

  describe 'remove_robot' do 
    it 'checks to see if robot was removed from table' do
      table.table[2][3] = 'R'

      table.remove_robot([3, 2])

      expect(table.table[2][3]).to eq '·'
    end
  end
end
