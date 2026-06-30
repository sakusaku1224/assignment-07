module ApplicationHelper
  # <% if @post.errors[:memo].any?%>
  # <%= @post.errors.full_messages_for(:memo).first%>
  # バリデーションをヘルパーメソッドとして共通化する
  def error_message_for(model, field)
    if model.errors[field].any?
      content_tag(:div, model.errors.full_messages_for(field).first, class: "text-danger")
    end
  end
end
