module VoteCount

def total_votes
    total = 0
    self.votes.each do |vote|
      total += vote.value
    end
    total
  end

end
