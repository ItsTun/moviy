ActiveAdmin.register Video do
  index do
    selectable_column
    id_column
    column :episode
    column :movie
    actions
  end

  show do |model|
    attributes_table do
      row :movie
      row :episode
      row :stream_url
      model.urls.each_with_index do |url, i|
        row "Url #{i}" do
          url.name
        end
      end
      row :clip do
        video_tag "#{url_for(model.clip)}", :size => "320x240", :controls => true if model.clip.attached?
      end
      row :download do
        link_to "Download", rails_blob_url(model.clip,"attachment"),target: :_blank if model.clip.attached?
      end
    end
  end

  filter :movie

  form do |f|
    f.inputs do
      f.input :movie_id, as: :select, collection: Movie.all
      f.input :episode
      f.input :stream_url
      f.label :video_clip
      f.file_field :clip
    end
    f.inputs do
      f.has_many :urls,
        allow_destroy: true do |model|
        model.input :name
      end
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit video:
      [:episode,
       :stream_url,
       :movie_id,
       :clip,
       urls_attributes: [:id, :name, :destroy]
      ]
    end
  end
end
