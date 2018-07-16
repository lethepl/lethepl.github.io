class Concert
  attr_reader :title, :place, :date, :city, :time, :ticket_price, :fb_link, :club_link
  def initialize(title, place, date, time, city, ticket_price, fb_link, club_link)
    @title = title
    @place = place
    @date = date
    @city = city
    @time = time
    @ticket_price = ticket_price
    @fb_link = fb_link
    @club_link = club_link
  end

  def to_html
    <<-HTML
            <li>
              <div class="concerts-table text-uppercase text-white">
                <h3 class="concerts-table__title">#{title}</h4>
                <div class="concerts-table__content">
                  <div class="concerts-table__section-35">
                    <p class="concerts-table__place">#{place}</p>
                    <p class="concerts-table__data">#{date} / #{city}</p>
                  </div>
                  <div class="concerts-table__section-30">
                      <div class="concerts-table__section-15">
                          <p class="concerts-table__caption">godzina</p>
                          <p class="concerts-table__data">#{time}</p>
                        </div>
                        <div class="concerts-table__section-15">
                          <p class="concerts-table__caption">bilety</p>
                          <p class="concerts-table__data">#{ticket_price}</p>
                        </div>
                  </div>
                  <div class="concerts-table__section-35">
                    <p class="concerts-table__caption">Linki</p>
                    <p class="concerts-table__data">
                      <a href="#{fb_link}" target="_blank">Facebook</a>
                      <span>/</span>
                      <a href="#{club_link}" target="_blank">strona klubu</a>
                    </p>
                  </div>
                </div>
              </div>
            </li>
    HTML
  end
end

# Edit here
concerts = [
  # Concert.new('Lethe w Kornecie', 'Kornet', '2018-09-01', '20:00', 'Kraków', 'wstęp wolny', 'fb.com', 'fb.com'),
]

concerts_html = <<-HTML
          <ul class="concerts-list">
#{concerts.map(&:to_html).map(&:chomp).join("\n")}
          </ul>
HTML

content = File.read('index.html')
content.gsub!(/          <ul class=\"concerts-list\">(.*?)<\/ul>/m, concerts_html.chomp)

File.open('index.html', 'w') { |file| file.write(content) }
