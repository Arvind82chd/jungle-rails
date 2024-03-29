require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end
  


  scenario "User clicks on product details" do

    # Act
    visit root_path

    # Debug
    save_screenshot('product_hover.png')

    # Verify
    page.first("article.product").click_on("Details")
    expect(page).to have_css 'section.products-show'
  end

  scenario "User sees product details" do
    # Act
    visit "products/1"

    #Debug
    save_screenshot('product_details.png')

    # Verify
    expect(page).to have_css 'section.products-show'

  end

  

end



  