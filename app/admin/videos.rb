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
    end
  end

  filter :movie

  form do |f|
    f.inputs do
      f.input :movie_id, as: :select, collection: Movie.all
      f.input :episode
      f.input :stream_url
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
