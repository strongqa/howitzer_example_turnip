module CategoryMaintainingSteps
  attr_accessor :category

  # GIVEN

  # WHEN

  step 'I click new category button on categories list page' do
    CategoriesListPage.on { add_new_category }
  end

  step 'I create new category on new category page' do
    self.category = build(:category)
    category_name = category.name
    NewCategoryPage.on { create_category(category_name) }
  end

  step 'I click edit button near the necessary category on categories list page' do
    category_name = category.name
    CategoriesListPage.on { edit_category(category_name) }
  end

  step 'I update name of category on edit category page' do
    self.category = build(:category)
    category_name = category.name
    EditCategoryPage.on { update_category(category_name) }
  end

  step 'I click delete button near the necessary category on categories list page' do
    category_name = category.name
    CategoriesListPage.on do
      delete_category(category_name)
      if Howitzer.driver == 'webkit'
        driver.browser.accept_js_confirms
      else
        Capybara.current_session.accept_alert
      end
    end
  end

  # THEN

  step 'I should see created category on categories list page' do
    category_name = category.name
    CategoriesListPage.on { is_expected.to have_category_item_element(category_name) }
  end

  step 'I should not see category on categories list page' do
    category_name = category.name
    CategoriesListPage.on { is_expected.not_to have_category_item_element(category_name) }
  end

  step 'I should be redirected to new category page' do
    NewCategoryPage.given
  end

  step 'I should be redirected to categories list page' do
    expect(CategoriesListPage).to be_displayed
  end

  step 'I should be redirected to edit category page' do
    EditCategoryPage.given
  end
end

RSpec.configure { |c| c.include CategoryMaintainingSteps, сategory_maintaining: true, articles_filtering: true }
