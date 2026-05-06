class Task < ApplicationRecord
    # タイトルは必須
    validates :title, presence: true
  
    # 開始日は必須
    validates :start_date, presence: true
  
    # 終了日は必須
    validates :end_date, presence: true
  
    # 開始日が終了日より前であることを確認
    validate :start_date_before_end_date
  
    private
  
    def start_date_before_end_date
      return if start_date.blank? || end_date.blank?
  
      if start_date > end_date
        errors.add(:end_date, "は開始日より後の日付を選択してください")
      end
    end
  end