class Cat < ActiveRecord::Base
    has_and_belongs_to_many :tags

    validates :name, presence: true

    validates :breed, presence: true

    # def slug
    #     name.downcase.gsub(' ','_')
    # end

    # def to_param
    #     "#{id}-#{slug}"
    # end

end
