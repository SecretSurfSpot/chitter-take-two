require './app/model/peep'

describe Peep do
  describe '.view_all_peeps' do
    it 'gets all peeps' do
      peeps = Peep.view_all_peeps

      expect(peeps).to include('this is my first peep')
      expect(peeps).to include('second time around')
      expect(peeps).to include('third time lucky?')
    end
  end

  describe '.create_new_peep' do
    it 'creates a peep' do
      new_peep = 'This is a test peep'
      peep = Peep.create_new_peep(content: new_peep)

      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep.content).to eq 'This is a test peep'

    end
  end
end
