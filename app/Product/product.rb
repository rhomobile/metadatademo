require 'json'
# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Product
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Product.
  # enable :sync

  #add model specifc code here
  
  def self.generate_metadata
    # define the metadata
      row = { 
        :text => '{{name}}',
        :type => 'linkli' 
      }
      
      list = {
        :label => "My Products",
        :type => "list",
        :repeatable => "{{@products}}",
        :children => [ row ]
      }
      
      title = {
        :title => "Overview",
        :type => "title"
      }
      
      view = { 
        :title => 'UI meta panel',
        :type => 'view',
        :children => [title, list] 
      }
    
      # return the definition as JSON
      {'index' => view}.to_json
  end

end
