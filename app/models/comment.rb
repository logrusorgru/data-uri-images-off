class Comment < ActiveRecord::Base
	validates_length_of :uname,
											:minimum => 3,
											:maximum => 28
	validates_length_of :content,
											:minimum => 3,
											:maximum => 280
end
