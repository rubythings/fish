require 'rails_helper'

RSpec.describe TempsController, type: :controller do
  it "should show the index page" do
    get :index
    expect(response).to be_success
    assert_template 'index'
  end

  it "should add a value" do
    post :create, :value => 1.00
    expect(response).to  be_success
    assert_template 'index'
  end
end
