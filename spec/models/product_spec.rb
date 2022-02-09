require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
    it "validates the all four entries" do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', price: 4, quantity: 3, category: @category)
      expect(@product).to be_valid
    end

    it "validates the name field" do
      @category = Category.new(name: 'test')
      @product = Product.new(name: nil, price: 4, quantity: 3, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq (["Name can't be blank"])
    end

    it "validates the price" do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', price: nil, quantity: 3, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq (["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it "validates the quantity" do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', price: 4, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq (["Quantity can't be blank"])
    end

    it "validates the category" do
      @category = nil
      @product = Product.new(name: 'test', price: 4, quantity: 3, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq (["Category can't be blank"])
    end
  end
end
