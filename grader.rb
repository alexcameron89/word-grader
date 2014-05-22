#Preliminary: Sets scores for letters & Finds wordlist from relative Ruby directory.
alphascore = {a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9, j: 10, k: 11, l: 12, m: 13, n: 14, o: 15, p: 16, q: 17, r: 18, s: 19, t: 20, u: 21, v: 22, w: 23, x: 24, y: 25, z: 26}
directory = File.expand_path(File.dirname(__FILE__))
words = File.open("#{directory}/wordlist.txt").read

puts "Which would you like to test? Word or Dictionary?"
choice = gets.chomp
choice.downcase!
word_array = []

case choice
when "word"
  puts "What's your word?"
  input = gets.chomp
  input.downcase!
  word_array << input
when "dictionary"
  words.each_line do |word|
    word.chomp!
    word_array << word
  end
else
  puts "Not sure what you mean."
end


grade_hash = {}

word_array.each do |word|
  next if /[^a-z]/.match(word)
  @wordScore = 0
  word.each_char do |c| 
    @wordScore += alphascore[c.to_sym]
  end
  grade_hash[word] ||= @wordScore
end

# grade_hash.select! { |key,value| value == 100}

puts "\n"
puts "GRADES"
grade_hash.each do |word,score|
  puts "#{word}: #{score}"
end

