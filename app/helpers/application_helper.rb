module ApplicationHelper
  def variant_url(attachment, option = :thumb)
    record = attachment.record
    attachment_variant = record.send(attachment.name + "_variants")[option]
    if attachment.attached?
      url_for(attachment.variant(attachment_variant))
    else
      ActionController::Base.helpers.asset_path('default.jpg')
    end
  end
end
