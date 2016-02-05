class Recipe < ActiveRecord::Base
	has_one :user
     has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
     validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
     validates :description, :ingredient, :direction, :specific, :difficulty, :title, :presence => true

     def recipes
     	self.all
     end

     def recipe
     	self.find params[:id]
     end
end
