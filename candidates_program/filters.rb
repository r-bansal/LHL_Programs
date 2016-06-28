
# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

require './candidates'

def find(id)
  raise '@candidates must be an Array' if @candidates.nil?
  @candidates.each {|person|
    return person if person[:id] == id
  }
  nil
end

def experienced?(candidate)
  unless candidate.has_key?(:years_of_experience)
    raise ArgumentError, 'candidate must have a :years_of_experience key'
  end
  candidate[:years_of_experience] >= 2
  # candidate.each {|person|
  #   return true if person[:years_of_experience] >= 2
  #   return false
  # }

end

def qualified_candidates(hash)
  qualified_people = []
  hash.each {|candidate|
    if experienced?(candidate) \
      && candidate[:github_points] >=100 \
      && (candidate[:languages].any? { |x| ['Ruby','Python'].include? x }) \
      && candidate[:age] >= 18 \
      && candidate[:date_applied] > 15.days.ago.to_date
        qualified_people << candidate
    end
  }
  qualified_people
end


def ordered_by_qualifications(hash)
  hash.sort_by { |candidate| [candidate[:years_of_experience], -candidate[:github_points]] }
end



# More methods will go below
