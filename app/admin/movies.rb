ActiveAdmin.register Movie do
  permit_params :name, :country_id, :type_id, :user_id, :release_date, :imdb, :rating, :description
  index do
    selectable_column
    id_column
    column :name
    column :country
    column :type
    column :user
    column :release_date
    column :imdb
    column :rating
    column :description
    actions
  end

  show do |model|
    attributes_table do
      row :name
      row :country
      row :type
      row :user
      row :release_date
      row :imdb
      row :rating
      row :description
      model.genres.each_with_index do |genre, i|
        row "Genre #{i}" do
          genre.name
        end
      end
    end
  end

  filter :name
  filter :country
  filter :type
  filter :user
  filter :release_date 
  filter :imdb
  filter :rating
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :country_id, as: :select, collection: Country.all
      f.input :type_id, as: :select, collection: Type.all
      f.input :user_id, as: :select, collection: User.all
      f.input :genres, as: :check_boxes, :collection => Genre.all.map{ |genre|  [genre.name, genre.id] }
      f.input :release_date
      f.input :imdb
      f.input :rating
      f.input :description
    end
    f.actions
  end
end
