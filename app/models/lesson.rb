class Lesson < ActiveRecord::Base
  belongs_to :section
  validates :name, :presence => true

  # def self.get_previous_lesson(current_lesson)
    # Lesson.where("lessons.id < ? ", current_lesson.id).order('created_at asc').last
  # end

  # def self.get_next_lesson(current_lesson)
    # Lesson.where("lessons.id > ? ", current_lesson.id).order('created_at asc').first
  # end

end
