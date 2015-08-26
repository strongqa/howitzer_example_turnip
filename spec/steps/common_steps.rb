module Turnip::Steps

  attr_accessor :new_article, :new_user

#############################################################
#                      PREREQUISITES                        #
#############################################################

  step "opened browser" do
    HomePage.open
  end

  step "I am on :page page" do |page|
    page.open
  end

  step "I am logged to the system as :user user" do |user|

    if user == "admin"
      LoginPage.open.login_as(settings.def_test_user, settings.def_test_pass)
    else
      self.new_user = FactoryGirl.build(:user).save!
      LoginPage.open.login_as(self.new_user.email, self.new_user.password)
    end

  end

  step "created article" do
    ArticleListPage.open.add_new_article
    self.new_article = FactoryGirl.build(:article).save!
    NewArticlePage.given.fill_form(self.new_article).submit_form
  end

####################################
#              ACTIONS             #
####################################

  step "I open :page page" do |page|
    page.open
  end

####################################
#              CHECKS              #
####################################

  step ":page page should be displayed" do |page|
    page.wait_for_opened
  end

end