class SequentialCompletionValidator < ActiveModel::Validator
  def validate(record)
    last_record = record.get_latest
    unless record.progress_to_int == ((last_record.try(:progress_to_int) || 0) + 1)
      record.errors['lesson'] << "lesson not completed in sequential order."
      record.errors['part'] << "part not completed in sequential order."
    end
  end
end
