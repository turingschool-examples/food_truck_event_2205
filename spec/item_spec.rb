require 'spec_helper'
require_relative '../lib/item'

RSpec.describe Item do
  let(:item) { described_class.new({ name: 'Peach Pie (Slice)', price: '$3.75' }) }

  it 'has a name' do
    expect(item.name).to eq('Peach Pie (Slice)')
  end

  it 'has a price' do
    expect(item.price).to eq('$3.75')
  end
end
