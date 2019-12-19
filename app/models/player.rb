class Player < ApplicationRecord
    # belongs_to :teamRef, :foreign_key => 'teamRef', :class_name  => 'Team', :primary_key => 'sportradarRef'
    belongs_to :team
end
