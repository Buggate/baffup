module ApplicationHelper

  def human_boolean(accept)
    accept ? 'Thanks for the invitation. I will gladly honour the invitation with my presence.' : 'With regrets, I am not going to be attending this occasion. Thanks for the invitation still.'
  end

 # def sortable(column, title = nil)
   # title ||= column.titleize
   # css_class = column == sort_column ? "current #{sort_direction}" : nil
   # direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
   # link_to title, {:sort => column, :direction => direction}, {:class => css_class}
#  end

=begin
  def sortable_search(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:utf8 => '✓', :search => params[:search], :sort => column, :direction => direction}, {:class => css_class}
  end
=end

end
