require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a product that has all four fields set' do
      @category = Category.new(name: "Best Category")
      @product = Product.new(name: 'Best Product', price: 500, quantity: 30, category: @category)
      expect(@product.save).to be true
    end

    it 'should not save a product if name is not set' do
      @category = Category.new(name: "Best Category")
      @product = Product.new(name: nil, price: 500, quantity: 30, category: @category)
      expect(@product.save).to be false
    end


  end
end
