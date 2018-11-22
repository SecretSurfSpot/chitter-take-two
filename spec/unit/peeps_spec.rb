require './app/model/peep'

describe Peep do
  describe 'all peeps' do
    it 'gets all peeps' do
      peeps = Peep.all

      expect(peeps).to include('this is my first peep')
      expect(peeps).to include('second time around')
      expect(peeps).to include('third time lucky?')
    end
  end
end
