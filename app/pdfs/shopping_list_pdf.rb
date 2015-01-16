class ShoppingListPdf < Prawn::Document

	def initialize(consolidated_cart)
		super()
		@cart = consolidated_cart
		header
		generate_content
	end

	def generate_content
		bounding_box([0,600], :width => 270, :height => 300) do
	      
	      @cart.each do |i|

	      	text "#{i[:item]} #{i[:amount].try(:to_s)} #{i[:unit].try(:to_s)}" 
	      	
	      end
	      
	      # text "Lorem ipsum", size: 15, style: :bold
	      # text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum semper placerat. Aenean mattis fringilla risus ut fermentum. Fusce posuere dictum venenatis. Aliquam id tincidunt ante, eu pretium eros. Sed eget risus a nisl aliquet scelerisque sit amet id nisi. Praesent porta molestie ipsum, ac commodo erat hendrerit nec. Nullam interdum ipsum a quam euismod, at consequat libero bibendum. Nam at nulla fermentum, congue lectus ut, pulvinar nisl. Curabitur consectetur quis libero id laoreet. Fusce dictum metus et orci pretium, vel imperdiet est viverra. Morbi vitae libero in tortor mattis commodo. Ut sodales libero erat, at gravida enim rhoncus ut."
	    end
	end
	def header
		
	end
end