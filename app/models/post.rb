class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum:250 }
    validates :summary, length: { maximum:250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }  
    validate :clickbait

    def clickbait
        if { in:["Won't Believe", "Secret", `Top #{number}`, "Guess"]} 
            errors.add(:title, "must be clickbait")
        end
    end
end
