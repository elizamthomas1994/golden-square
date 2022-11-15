require 'check_codeword'

RSpec.describe "check_codeword method" do 
  it "outputs a positive answer if user enters 'horse'" do
    result = check_codeword('horse')
    expect(result).to eq "Correct! Come in."
  end

  it "outputs a nearly response if input starts with 'h' and ends with 'e'" do
    result = check_codeword('house')
    expect(result).to eq "Close, but nope."
  end

  it "outputs a negative response if input isn't even close" do
    result = check_codeword('pizza')
    expect(result).to eq "WRONG!"
  end

end