class User < ActiveRecord::Base
  has_many :matches

  def from_omniauth(auth)
    info = auth['info']
    # Convert from 64-bit to 32-bit
    user = find_or_initialize_by(uid: (auth['uid'].to_i - 76561197960265728).to_s)
    user.nickname = info['nickname']
    user.avatar_url = info['image']
    user.profile_url = info['urls']['Profile']
    user.save!
    user
  end

  def load_matches!(count)
    matches_arr = Dota.api.matches(player_id: self.uid, limit: count)
    if matches_arr && matches_arr.any?
      matches_arr.each do |match|
        unless self.matches.where(uid: match.id).any?
          match_info = Dota.api.matches(match.id)
          # new_match = self.matches.create({
          self.matches.create({
            uid: match.id,
            winner: match_info.winner.to_s.titleize,
            first_blood: parse_duration(match_info.first_blood),
            started_at: match_info.starts_at,
            mode: match_info.mode,
            cluster: match_info.cluster,
            duration: parse_duration(match_info.duration),
            match_type: match_info.type
          })
        end
      end
    end
  end
end
