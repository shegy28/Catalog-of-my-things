require_relative './Ruby_Classes/menu'
require_relative './Ruby_Classes/app'

def main
  app = App.new
  menu = Menu.new(app)
  menu.start
end

main
