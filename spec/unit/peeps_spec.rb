require './app/model/peep'

describe Peep do
  describe 'all peeps' do
    it 'gets all peeps' do
      peeps = Peep.all

      expect(peeps).to include('first peep')
      expect(peeps).to include('second peep')
      expect(peeps).to include('third peep')
    end
  end
end
