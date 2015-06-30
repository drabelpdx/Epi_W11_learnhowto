require 'rails_helper'

describe "the edit a lesson process" do
  it "edits a lesson" do
    lesson = Lesson.create(:name => 'Home stuff')
    visit lesson_path(lesson)
    click_on 'Edit'
    fill_in 'Name', :with => 'Test Lesson'
    click_on 'Update Lesson'
    expect(page).to have_content 'Test Lesson'
  end

  it "gives error when no description is entered" do
    lesson = Lesson.create(:name => 'Home stuff')
    visit lesson_path(lesson)
    click_on 'Edit'
    fill_in 'Name', :with => ''
    click_on 'Update Lesson'
    expect(page).to have_content 'errors'
  end
end
