require 'spec_helper'
describe User do
    it "is not valid without an email" do
      article = User.new(email: nil)
      article.should_not be_valid
    end
end