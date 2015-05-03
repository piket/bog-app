class Tag < ActiveRecord::Base
    has_and_belongs_to_many :cats

    validates :name, presence: true

    def slug
        name.gsub(' ','_')
    end

    def to_param
        "#{slug}"
    end
end
