module LessonsHelper
    def completed_lesson?(category)
        return Lesson.where(category_id: category, user_id: current_user.id).exists?
    end

    def finished_lesson(category)
        return Lesson.where(category_id: category, user_id: current_user.id).pluck(:id)
    end
end
