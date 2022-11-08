require 'string_builder'

RSpec.describe StringBuilder do
  it 'returns an empty string' do
    string_builder = StringBuilder.new
    expect(string_builder.output).to eq ''
  end

  it 'adds a string to the empty' do
    string_builder = StringBuilder.new
    string_builder.add('hello, world')
    expect(string_builder.output).to eq 'hello, world'
  end

  it 'returns a length of 0' do
    string_builder = StringBuilder.new
    expect(string_builder.size).to eq 0
  end
end