class GuestList
  include ActiveModel::Model

  def initialize(options={})
    @csv_file = options.fetch(:csv_file, nil)
    # These could maybe be initialized better
    @guest_count = 0
    @saved = false
  end

  def guest_count
    @guest_count
  end

  def save
    return unless @csv_file.present?
    roo_file = Roo::Spreadsheet.open(@csv_file)
    roo_file.each_row_streaming(offset: 1) do |row|
      guests_array = row.each_slice(2).map do |array|
        {first: array.last, last: array.first}
      end

      tour = Tour.new({
        title: tour_title(guests_array),
        guests_attributes: guests_array,
      })
      tour.save!
      @guest_count += tour.guests.count
    end
    @saved = true
  end

  private
  def tour_params(row)
    guests_array = row.each_slice(2).map do |array|
      {first: array.last.to_s, last: array.first.to_s}
    end

    {
      title: tour_title(guests_array),
      guest_attributes: guests_array,
    }
  end

  def tour_title(tour_guests)
    puts tour_guests.length
    group_descriptor = tour_guests.length > 1 ? "Family" : "Party of 1"
    tour_head = tour_guests.first
    "#{tour_head[:first]} #{tour_head[:last]}'s #{group_descriptor}"
  end
end