ActiveAdmin.register Video do
  permit_params :name, :url, :episode, :movie_id, :thumbnail, :clip
  index do
    selectable_column
    id_column
    column :name
    column :url
    column :episode
    column :movie
    actions
  end

  show do |model|
    attributes_table do
      row :name
      row :url
      row :episode
      row :movie
      row :image do
        image_tag url_for(model.thumbnail)
      end
      row :clip do
        video_tag "#{url_for(model.clip)}", :size => "320x240", :controls => true
      end
      row :download do
        link_to rails_blob_path(model.clip, disposition: "attachment")
      end
    end
  end

  filter :movie

  form do |f|
    f.inputs do
      f.input :name
      f.input :url
      f.input :episode
      f.input :movie_id, as: :select, collection: Movie.all
      f.file_field :thumbnail
      f.file_field :clip
    end
    f.actions
  end
end
