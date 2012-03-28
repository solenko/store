class StaticPagesController < ApplicationController
  layout "static"

  def main
    @title = "Главная"
  end

  def contacts
    @text = StaticPage.find_by_name("contacts")
    @title = "Контакты"
  end
  
  def stock
    @text = StaticPage.find_by_name("stock")
	@title = "Акции"
  end
  
  def terms
    @text = StaticPage.find_by_name("terms")
	@title = "Условия"
  end
  
  def about
    @text = StaticPage.find_by_name("about")
	@title = "О Нас"
  end
  
  def sizes
    @text = StaticPage.find_by_name("sizes")
	@title = "О Нас"
  end

end
