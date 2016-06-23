
# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

require './candidates'

def find(id)
  @candidates.each {|person|
    return person if person[:id] == id
  }
  nil
end

def experienced?(candidate)
  candidate.each {|person|
    return true if person[:years_of_experience] >= 2
    return false
  }
end

def qualified_candidates(hash)
  qualified_people = []
  hash.each {|candidate|
    if candidate[:years_of_experience] >=2 \
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
