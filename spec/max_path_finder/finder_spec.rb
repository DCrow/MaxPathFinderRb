RSpec.describe MaxPathFinder::Finder do
  let(:nodes) do
    [
      [0],
      [1, 2],
      [3, 4, 5],
      [6, 7, 8, 9],
    ]
  end
  subject { MaxPathFinder::Finder.new(nodes) }

  it "should return correct max path" do
    expect(subject.max_path).to eq([0, 1, 2, 3])
  end

  it "should return correct max sum" do
    expect(subject.max_sum).to eq(16)
  end
end
