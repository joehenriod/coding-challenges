class Card
	attr_accessor :rank, :suit

	def initialize (rank, suit)
		@rank = rank
		@suit = suit
	end

	def output_card
		puts "#{self.rank} of #{self.suit}"
	end

	def self.random_card
		Card.new(rand(10), :spades)
	end
end

class Deck

	def initialize

		@cards = []
		

		ranks = %w{2 3 4 5 6 7 8 9 10 Jack Queen King Ace}
		suits = %w{hearts spades diamonds clubs}

		suits.each do |suit|
			ranks.each do |rank|
				@cards << Card.new(rank, suit)
			end
		end

	end



	def shuffle
		@cards.shuffle!
	end

	def deal
		return @cards.shift
	end

	def output
		@cards.each do |card|
			card.output_card
	end
end



deck = Deck.new
deck.shuffle

card = deck.deal
puts		card.output_card

end
