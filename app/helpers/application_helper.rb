module ApplicationHelper
  def link_to_remove_fields(name, child)
    child.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

def link_to_add_fields(name, f, association)
  new_object = f.class.reflect_on_association(association).klass.new
  fields = fields_for(association, new_object, :child_index => "new_#{association}") do |child|
    render(association.to_s.singularize + "_fields", :child => child)
  end
  link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
end


end


