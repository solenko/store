class StaticPagesController < ApplicationController
  layout "static"

  def main
    @title = "Главная"
  end

  def contacts
    @title = "Контакты"
  end

end
