ActiveAdmin.register Video do
  permit_params :name, :url, :episode, :movie_id
  index do
    selectable_column
    id_column
    column :name
    column :url
    column :episode
    column :movie
    actions
  end

  filter :movie

  form do |f|
    f.inputs do
      f.input :name
      f.input :url
      f.input :episode
      f.input :movie_id, as: :select, collection: Movie.all
    end
    f.actions
  end
end
