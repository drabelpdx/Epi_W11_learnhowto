require 'rails_helper'

describe "the add a lesson process" do
  it "adds a new lesson" do
    visit lessons_path
    click_on 'Create New Lesson'
    fill_in 'Name', :with => 'Home stuff'
    click_on 'Create Lesson'
    expect(page).to have_content 'Lessons'
  end

  it "gives error when no name is entered" do
    visit new_lesson_path
    click_on 'Create Lesson'
    expect(page).to have_content 'errors'
  end

end
