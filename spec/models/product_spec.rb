require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a product that has all four fields set' do
      @category = Category.new(name: "Best Category")
      @product = Product.new(name: 'Best Product', price: 500, quantity: 30, category: @category)
      expect(@product.save).to be true
    end

    it 'should show correct error message if name is not set' do
      @category = Category.new(name: "Best Category")
      @product = Product.create(name: nil, price: 500, quantity: 30, category: @category)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should show correct error message if price is not set' do
      @category = Category.new(name: "Best Category")
      @product = Product.create(name: "Best Product", price: nil, quantity: 30, category: @category)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should show correct error message if quantity is not set' do
      @category = Category.new(name: "Best Category")
      @product = Product.create(name: "Best Product", price: 500, quantity: nil, category: @category)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should show correct error message if category is not set' do
      @category = Category.new(name: "Best Category")
      @product = Product.create(name: "Best Product", price: 500, quantity: 30, category: nil)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
