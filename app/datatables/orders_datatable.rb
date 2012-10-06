# encoding: utf-8
class OrdersDatatable
  delegate :params, :h, :link_to, :edit_order_path, :number_to_currency, to: :@view
  
  def initialize(view)
    @view = view
  end
  
  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Order.count,
      iTotalDisplayRecords: orders.total_entries,
      aaData: data     
    }
  end
  
private

  def data
    orders.map do |order|
      [
        link_to(order.order_uuid, controller: :order_details, action: :new, id: order.id),
        number_to_currency(order.order_total, unit: "€"),
        h(order.order_date),
        h(order.order_done),
        link_to('Show', order),
        link_to('Edit', edit_order_path(order)),
        link_to('Destroy', order, method: :delete, data: { confirm: 'Are you sure?' })
      ]
    end
  end
  
  def orders
    @orders ||= fetch_orders
  end
  
  def fetch_orders
    orders = Order.order("#{sort_column} #{sort_direction}")
    orders = orders.page(page).per_page(per_page)
    if params[:sSearch].present?
      orders = orders.where("order_uuid like :search or order_date like :search", search: "%#{params[:sSearch]}%")
    end
    orders   
  end
  
  def page
    params[:iDisplayStart].to_i/per_page + 1
  end
  
  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end
  
  def sort_column
    columns = %w[order_uuid order_total order_date order_done]
    columns[params[:iSortCol_0].to_i]
  end
  
  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
  
end