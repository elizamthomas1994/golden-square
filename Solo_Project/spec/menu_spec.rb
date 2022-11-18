require 'menu'

RSpec.describe Menu do
  it 'returns an empty list when no dish entries are added' do
    menu = Menu.new
    expect(menu.list).to eq([])
  end
end