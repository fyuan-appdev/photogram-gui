class PhotosController < ApplicationController

  def index

    all_photos = Photo.all
    @list_of_photos = all_photos.order({ :created_at =>:desc})
    render ({ :template => "photo_template/index.html.erb"})
  end

  def detail
    input_id = params.fetch("photo_id")
    matching_photo = Photo.where({:id=> input_id})
    @photo = matching_photo.at(0)

    if @photo == nil
      redirect_to("/404")
    else
      @commenter = Comment.where({:photo_id =>@photo.id})
      render ({ :template => "photo_template/detail.html.erb"})
    end
  end


  def delete
    input_id = params.fetch("photo_id")
    matching_photo = Photo.where({:id=> input_id})
    photo = matching_photo.at(0)

    photo.destroy
  
    redirect_to("/photos")
  end


  def create_record
  # Parameters: {"input_image"=>"`", "input_caption"=>"1", "input_owner_id"=>"3"}
  
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")

    new_photo = Photo.new
    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id

    new_photo.save
    
    redirect_to("/photos/"+ new_photo.id.to_s)
  end

  def edit
    # Parameters: {"input_image"=>"https://robohash.org/modieumvoluptate.png?size=300x300&set=set1", "input_caption"=>"123213", "photo_id"=>"957"}
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    photo_id = params.fetch("photo_id")

    updated_photo = Photo.where({:id =>photo_id}).at(0)
    updated_photo.image = input_image
    updated_photo.caption = input_caption
    updated_photo.save

    redirect_to("/photos/"+ updated_photo.id.to_s)

  end

  def insert_comment
    #Parameters: {"input_photo_id"=>"957", "input_author_id"=>"", "input_body"=>""}
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_body")
    
    new_comment = Comment.new
    new_comment.photo_id = input_photo_id
    new_comment.author_id = input_author_id
    new_comment.body = input_body
    new_comment.save

    redirect_to("/photos/"+ input_photo_id.to_s)

  end



end
