RSpec.describe MaxPathFinder do
  context '#find' do
    it 'should return formatted result' do
      expect(MaxPathFinder.display('spec/data/nodes.txt')).to eq(File.read('spec/data/nodes_result.txt').chop)
    end
  end
end
