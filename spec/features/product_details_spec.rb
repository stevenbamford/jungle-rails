require 'rails_helper'

RSpec.feature "Visitor can see product details page by clicking on product from catalogue", type: :feature, js: true do

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

  scenario "Click on product" do

    visit root_path
    # ACT
    first('article.product').first('a').click

    sleep(3)
    # DEBUG / VERIFY
    save_screenshot

  end
end
