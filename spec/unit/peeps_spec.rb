require './app/model/peep'

describe Peep do
  describe '.view_all_peeps' do
    it 'gets all peeps' do
      peeps = Peep.view_all_peeps
      p "Hey I am peep[0] #{peeps[0].content}"
      expect(peeps[0].content).to include('this is my first peep')
      expect(peeps[1].content).to include('second time around')
      expect(peeps[2].content).to include('third time lucky?')
    end
  end

  describe '.create_new_peep' do
    it 'creates a peep' do
      new_peep = 'This is a test peep'
      peep = Peep.create_new_peep(content: new_peep)
      peeps = Peep.view_all_peeps
      expect(peeps[3].content).to include('This is a test peep')
    end
  end
end
