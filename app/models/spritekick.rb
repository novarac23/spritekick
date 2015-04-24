class Spritekick < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "600x400#", :thumb => "300x300#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  scope :get_latest_kicks, -> { all.order('created_at DESC') }
  scope :get_oldest_kicks, -> { all.order('created_at ASC') }

  searchkick

  CATEGORIES = ['Sport', 'Music', 'Tech']

  def self.move_up(id)
    sprite = Spritekick.where(id: id).first
    current_num_of_votes = sprite.votes
    if (current_num_of_votes == nil) || (current_num_of_votes == 0)
      sprite.update_attribute('votes', 1)
    else
      sprite.update_attribute('votes', current_num_of_votes + 1)
    end
  end

  def self.move_down(id)
    sprite = Spritekick.where(id: id).first
    current_num_of_votes = sprite.votes
    if (current_num_of_votes == nil) || (current_num_of_votes == 1)
      sprite.update_attribute('votes', 0) 
    else
      sprite.update_attribute('votes', current_num_of_votes - 1)
    end
  end

end
