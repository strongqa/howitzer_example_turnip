module CategoryMaintainingSteps
  attr_accessor :category

  # GIVEN

  # WHEN

  step 'I click new category button on categories list page' do
    CategoriesListPage.on { add_new_category }
  end

  step 'I crete new category on new category page' do
    self.category = build(:category)
    s = self
    NewCategoryPage.on { create_category(s.category.name) }
  end

  step 'I click edit button near nedded category on categories list page' do
    s = self
    CategoriesListPage.on { edit_category(s.category.name) }
  end

  step 'I update name of category on edit category page' do
    self.category = build(:category)
    s = self
    EditCategoryPage.on { update_category(s.category.name) }
  end

  step 'I click delete button near nedded category on categories list page' do
    s = self
    CategoriesListPage.on { delete_category(s.category.name) }
  end

  # THEN

  step 'I should see created category on categories list page' do
    s = self
    CategoriesListPage.on { is_expected.to have_category_item_element(s.category.name) }
  end

  step 'I should not see category on categories list page' do
    s = self
    CategoriesListPage.on { is_expected.not_to have_category_item_element(s.category.name) }
  end

  step 'I should be redirected to new category page' do
    NewCategoryPage.given
  end

  step 'I should be redirected to categories list page' do
    CategoriesListPage.given
  end

  step 'I should be redirected to edit category page' do
    EditCategoryPage.given
  end
end

RSpec.configure { |c| c.include CategoryMaintainingSteps, сategory_maintaining: true }
