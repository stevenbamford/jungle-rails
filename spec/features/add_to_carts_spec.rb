require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

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
    first('article.product').find_link("Add").click

    sleep(3)

    page.has_content?("My Cart (1)")
    save_screenshot

  end
end
