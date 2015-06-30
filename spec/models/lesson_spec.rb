require 'rails_helper'

describe Lesson do
  it { should validate_presence_of :name }
end

describe Lesson do
  context '#next' do
    it 'returns the lesson with the next-highest number than the current lesson' do
      current_lesson = Lesson.create({:name => 'lesson1', :number => 1})
      next_lesson = Lesson.create({:name => 'lesson2', :number => 2})
      expect(current_lesson.next).to eq next_lesson
    end
  end
end
