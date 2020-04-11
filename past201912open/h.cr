# 第一回 アルゴリズム実技検定 過去問 H - まとめ売り / Bulk Selling
# https://atcoder.jp/contests/past201912-open/tasks/past201912_h

n = read_line.to_i64
c = read_line.split.map(&.to_i64)
q = read_line.to_i64
s = Array.new(q) { read_line.split.map(&.to_i64) }

class Card
  def initialize(@count : Int64, index : Int64)
    @in_set = index.odd?
  end

  property :count
  getter in_set : Bool

  def allocatable?(n : Int64)
    @count >= n
  end

  def allocate(n : Int64)
    @count -= n
  end
end

class Cards
  def initialize(cards : Array(Card))
    @in_set = [] of Card | Nil
    @out_of_set = [] of Card | Nil

    cards.each_with_index do |card, i|
      if card.in_set
        @in_set.push(card)
        @out_of_set.push(nil)
      else
        @out_of_set.push(card)
        @in_set.push(nil)
      end
    end

    @count_min_in_set = cards_in_set.as(Array(Card)).min_of(&.count)
    @count_min_out_of_set = cards_out_of_set.as(Array(Card)).min_of(&.count)
  end

  getter in_set : Array(Card | Nil)
  getter out_of_set : Array(Card | Nil)

  property count_min_in_set : Int64
  property count_min_out_of_set : Int64

  private def fetch(i : Int64) : Card
    if @in_set[i].class == Card
      @in_set[i].as(Card)
    else
      @out_of_set[i].as(Card)
    end
  end

  private def cards_in_set
    in_set.reject(&.nil?)
  end

  private def cards_out_of_set
    out_of_set.reject(&.nil?)
  end

  private def all_cards : Array(Card)
    (cards_in_set + cards_out_of_set).as(Array(Card))
  end

  def count_min : Int64
    [count_min_in_set, count_min_out_of_set].min
  end

  def process_normal(card_number : Int64, order_count : Int64) : Int64
    card = fetch(card_number)

    return 0_i64 unless card.allocatable?(order_count)

    card.allocate(order_count)

    if card.in_set
      self.count_min_in_set = [count_min_in_set, card.count].min
    else
      self.count_min_out_of_set = [count_min_out_of_set, card.count].min
    end

    return order_count
  end

  def process_set(card_number : Int64, order_count : Int64)
    return 0_i64 if count_min_in_set < order_count

    _cards_in_set = cards_in_set

    _cards_in_set.each do |card|
      card.as(Card).allocate(order_count)
    end

    self.count_min_in_set = _cards_in_set.as(Array(Card)).min_of(&.count)

    order_count * _cards_in_set.size
  end

  def process_whole(order_count : Int64)
    return 0_i64 if count_min < order_count

    _all_cards = all_cards

    _all_cards.each do |card|
      card.allocate(order_count)
    end

    self.count_min_in_set = cards_in_set.as(Array(Card)).min_of(&.count)
    self.count_min_out_of_set = cards_out_of_set.as(Array(Card)).min_of(&.count)

    order_count * _all_cards.size
  end
end

class Query
  def initialize(array : Array(Int64))
    if array.size == 3
      @query_type, @card_number, @order_count = array
      @card_number -= 1_i64
    else
      @query_type, @order_count = array
      @card_number = -1.to_i64
    end
  end

  getter query_type : Int64, card_number : Int64, order_count : Int64

  def process(cards : Cards)
    case @query_type
    when 1_i64
      cards.process_normal(card_number, order_count)
    when 2_i64
      cards.process_set(card_number, order_count)
    else
      cards.process_whole(order_count)
    end
  end
end

card_objects = c.map_with_index { |count, i| Card.new(count, (i + 1).to_i64) }
cards = Cards.new(card_objects)

all_orders = 0_i64

queries = s.map { |a| Query.new(a) }

queries.each do |q|
  orders = q.process(cards)
  all_orders += orders
end

puts all_orders
