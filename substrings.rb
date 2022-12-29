#  > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#  > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# substrings("below", dictionary)
# { "below" => 1, "low" => 1 }

def substrings(string, dictionary)
#two arguments given are string and dictionary
  words = string.downcase.split
#make string lowercase and split into an array of words
  counts = {}
#empty hash called counts to store substring and count
  words.each do |word|
#loop to iterate through words array
    dictionary.each do |substring|
#loop within to iterate over substring in dicitonary array
      if word.include?(substring)
#checking if substring is contained within word
        counts[substring] ||= 0
#if it is included begin count at 0, then increment upwards
        counts[substring] += 1
      end
    end
  end
  counts
#return counts hash once completed
end
