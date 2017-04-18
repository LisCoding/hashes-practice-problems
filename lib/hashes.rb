# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  hash_words = {}
  str.split.each {|word| hash_words[word] = word.length}
  hash_words
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.key(hash.values.max)
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |key , value|
    older[key] = value
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  letters_hash = Hash.new(0)
  word.chars { |char| letters_hash[char] += 1 }
  letters_hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr) #[2,2,3,5] => 2,3,5
  uniq_values = Hash.new(0)
  arr.each {|num| uniq_values[num] = 0 unless uniq_values.key?(num) }
  uniq_values.keys.to_a
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  evens_and_odds_hash = Hash.new(0)
  numbers.each do |num|
    if num.even?
      evens_and_odds_hash[:even] += 1
    else
      evens_and_odds_hash[:odd] += 1
    end
  end
  evens_and_odds_hash
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  vowels_hash = Hash.new(0)
  vowels = "aeiou"
  string.chars { |char| vowels_hash[char] +=1 if vowels.include?(char) }
  max = vowels_hash.values.max
  vowels = vowels_hash.sort_by {|k,v| k}.flatten
  (0...vowels.length).each do |i|
  	return vowels[i- 1] if vowels[i] == max
  end
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  students_birthdays = students.select {|k, v| v > 6}
  students_birthdays.keys.to_a.combination(2).to_a
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)#[cat, cat, cat]
  specimens_hash = Hash.new(0)
  specimens.each {|specimen| specimens_hash[specimen] += 1}
  specimens_hash.length ** 2 * (specimens_hash.values.min / specimens_hash.values.max)
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  vandalized_hash = {}
  vandalized_sign.downcase.chars do |char|
    vandalized_hash[char] = vandalized_sign.count(char)
  end
  vandalized_hash.each do |k,v|
    return false if v > normal_sign.count(k)
  end
  true
end

# def character_count(str)
# end
