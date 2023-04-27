class PhotosController < ActionController::Base

  def index

    all_photos = Photo.all

    @list_of_photos = all_photos.order({ :created_at =>:desc})

    render ({ :template => "photo_template/index.html.erb"})
  end

  def detail
    input_id = params.fetch("photo_id")
    matching_photo = Photo.where({:id=> input_id})
    @photo = matching_photo.at(0)

    @commenter = Comment.where({:photo_id =>@photo.id})

    if @photo == nil
      redirect_to("/404")
    else
      render ({ :template => "photo_template/detail.html.erb"})
    end
  end

end
