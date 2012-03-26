class StaticPage < ActiveRecord::Base
	validates_presence_of :name, :text
end
