describe Grid do
  subject(:grid) { described_class.new }
  it "can generate an array of arrays" do
    expect(grid.generate(-1, 1, -1, 1)).to eq(
      {
        [-1, 1] => nil, [0, 1] => nil, [1, 1] => nil,
        [-1, 0] => nil, [0, 0] => nil, [1, 0] => nil,
        [-1,-1] => nil, [0,-1] => nil, [1,-1] => nil
      }
    )
  end
end
