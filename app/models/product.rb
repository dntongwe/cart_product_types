class Product < ActiveRecord::Base
	belongs_to :category
	has_many :cart_items
	belongs_to :product_type
	serialize :properties, Hash
	validate :validate_properties

	def self.search(search)
		if search
			self.all.order(:name).where(['name LIKE ?', "%#{search}%"])
		else
			self.all
		end
	end

	def category_name
		category.try(:name)
	end

	def category_name=(name)
		self.category = Category.find_or_create_by(name: name) if name.present?
	end



  validate :validate_properties
  
  def validate_properties
    product_type.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must not be blank"
      end
    end
  end
  
end