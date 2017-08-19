describe Matrix do
  subject(:matrix) {described_class.zero(3)}
  it "can assign values to elements" do
    matrix[0, 0]= 'test assignment'
    expect(matrix[0,0]).to eq 'test assignment'
  end
end
