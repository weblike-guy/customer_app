class StaffEventPresenter < ModelPresenter
  delegate :member, :description, :occurred_at, to: :object

  def table_row
    markup(:tr, class: 'row') do |m|
      unless view_context.instance_variable_get(:@staff_member)
        m.td(:class => 'col-md-6') do
          m << link_to(member.family_name + member.given_name,
             [ :admin, member, :staff_events ])
        end
      end
       m.td(:class => 'col-md-2') do
           m.text description
       end
       m.td(:class => 'date col-md-4') do
        m.text occurred_at.strftime('%Y/%m/%d %H:%M:%S')
       end
    end
  end
end
