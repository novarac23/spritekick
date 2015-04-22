class Spritekick < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "600x400#", :thumb => "300x300#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  scope :get_latest_kicks, -> { all.order('created_at DESC') }
  scope :get_oldest_kicks, -> { all.order('created_at ASC') }

  searchkick

  def self.move_up(id)
    #TODO is it smart to search for a particular instance of a model inside of a model method?
    #TODO figure out should you call other models from within a model
    sprite = Spritekick.where(id: id).first
    current_num_of_votes = sprite.votes
    #user = User.find(sprite.user_id)
    if (current_num_of_votes == nil) || (current_num_of_votes == 0) #TODO change to be a dynamic value current_user.id
      sprite.update_attribute('votes', 1)
      #user.update_attribute('voted', true)
    else
      sprite.update_attribute('votes', current_num_of_votes + 1)
      #user.update_attribute('voted', true)
    end
  end

  def self.move_down(id)
    #TODO is it smart to search for a particular instance of a model inside of a model method?
    sprite = Spritekick.where(id: id).first
    current_num_of_votes = sprite.votes
    if (current_num_of_votes == nil) || (current_num_of_votes == 1) #TODO change to be a dynamic value current_user.id
      sprite.update_attribute('votes', 0) 
    else
      sprite.update_attribute('votes', current_num_of_votes - 1)
    end
  end

end
